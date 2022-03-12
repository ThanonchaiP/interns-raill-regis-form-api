class Client < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_one_attached :image
  belongs_to :gender
  belongs_to :race
  belongs_to :shirt_size

  def as_json(options = nil)
    super({
      only: [:id, :first_name, :last_name, :email, :phone]
    }).merge({
      "gender" => gender.name,
      "race" => race.name,
      "price" => race.price,
      "shirt": {
        "shirt_size" => shirt_size.size,
        "chest" => shirt_size.chest,
      },
      # "address": {
      #   "house_no" => house_no,
      #   "sub_district" => sub_district.name_th,
      #   "district" => district.name_th,
      #   "province" => province.name_th,
      #   "postcode" => postcode
      # }  
    })
  end

  def as_image_json
    json = self.as_json
    if self.image.present?
      json[:image] = rails_blob_path(self.image)
    end
    json
  end

  def self.search_id(search,search_name,search_lastname)
    if search 
      where(["id = ?","#{search}"])
    elsif search_name and search_lastname
      where(["first_name LIKE ? AND last_name LIKE ?", "%#{search_name}%","%#{search_lastname}%"])
    elsif search_name
      where(["first_name LIKE ?", "%#{search_name}%"])
    else
      all
    end
  end

end