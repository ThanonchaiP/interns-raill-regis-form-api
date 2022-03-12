# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Gender.create([{ name: 'ชาย' }, { name: 'หญืง' }])

Race.create([
    { name: 'Early Bird : 4 KM' , price:300 },
    { name: 'Early Bird : 11 KM' , price:950 },
    { name: 'Early Bird : 25 KM' , price:1300 },
    { name: 'Early Bird : 50 KM' , price:1700 }
])

ShirtSize.create([
    { size: 'XS' , chest: '36' },
    { size: 'S' , chest: '38' }, 
    { size: 'M' , chest: '40' },
    { size: 'L' , chest: '42' },
    { size: 'XL' , chest: '44' },
    { size: '2XL' , chest: '46' },
    { size: '3XL' , chest: '48' },
    { size: '4XL' , chest: '50' },
    { size: '5XL' , chest: '52' },
    { size: '6XL' , chest: '54' }
])
# require_relative './province'
# require_relative './amphoe'
# require_relative './tambol'
require 'csv'  
csv_text_provinces = File.read('lib/tasks/submigrate/provinces.csv')
csv = CSV.parse(csv_text_provinces, :headers => true)
csv.each do |row|
  Province.create!(row.to_hash)
end
csv_text_districts = File.read('lib/tasks/submigrate/districts.csv')
csv = CSV.parse(csv_text_districts, :headers => true)
csv.each do |row|
  District.create!(row.to_hash)
end
csv_text_sub_districts = File.read('lib/tasks/submigrate/sub_districts.csv')
csv = CSV.parse(csv_text_sub_districts, :headers => true)
csv.each do |row|
  SubDistrict.create!(row.to_hash)
end