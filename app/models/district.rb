class District < ApplicationRecord
  belongs_to :province

  def self.search_province(search)
    if search 
      where(["province_id = ?","#{search}"])
    else
      all
    end
  end

end
