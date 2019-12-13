# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

CSV.foreach('db/prefectures.csv', headers: true) do |row|
  Prefecture.create(name: row[0], simplified: row[1])
end

CSV.foreach('db/provinces.csv', headers: true) do |row|
  Province.create(
    jpkanji: row[0],    
    simplified: row[1],
    pinyin: row[2]
  )
end

CSV.foreach('db/jpcities.csv', headers: true) do |row|
  Jpcity.create(
    pref: row[0],
    jpkanji: row[1], 
    simplified: row[2],
    hira: row[3],
    alphabet: row[4], 
    pinyin: row[5]
  )
end

CSV.foreach('db/chcities.csv', headers: true) do |row|
  Chcity.create(
    jpkanji: row[0], 
    hira: row[1],
    simplified: row[2],
    pinyin: row[3],
    prov: row[4]
  )
end

CSV.foreach('db/chcity2s.csv', headers: true) do |row|
  Chcity2.create(
    latitude: row[1],
    longitude: row[2],
    prov: row[3],
    income:row[7],
    r_price:row[8],
    chcity_id: row[0],
    popul: row[4],
    size: row[5],
    dense:row[6],
    latitude_id:row[9]
  )
end

CSV.foreach('db/jpcity2s.csv', headers: true) do |row|
  Jpcity2.create(
    latitude: row[0],
    longitude: row[1],
    pref: row[2],
    r_price:row[3],
    income:row[4],
    jpcity_id: row[5],
    popul: row[6],
    size: row[7],
    dense:row[8],
    latitude_id:row[9]
  )
end

# CSV.foreach('db/latitudes.csv', headers: true) do |row|
#   Latitude.create(
#     lat_min: row[0],
#     lat_max: row[1]
#   )
# end