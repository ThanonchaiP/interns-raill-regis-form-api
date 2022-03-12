class Address < ApplicationRecord
  belongs_to :client
  belongs_to :sub_district
  belongs_to :district
  belongs_to :province
end
