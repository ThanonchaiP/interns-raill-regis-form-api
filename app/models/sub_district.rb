class SubDistrict < ApplicationRecord
  belongs_to :district

  def self.search_district(search)
    if search 
      where(["district_id = ?","#{search}"])
    else
      all
    end
  end
  
end
