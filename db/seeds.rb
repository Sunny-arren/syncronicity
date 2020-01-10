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
    hira: row[4],
    alphabet: row[5], 
    pinyin: row[6],
    latitude:row[7],
    longitude:row[8],
    kind:row[3]
  )
end

CSV.foreach('db/chcities.csv', headers: true) do |row|
  Chcity.create(
    jpkanji: row[0], 
    hira: row[1],
    simplified: row[2],
    pinyin: row[4],
    latitude:row[6],
    longitude:row[7],
    kind:row[3],
    province_id:row[5]
  )
end

# CSV.foreach('db/chcity2s.csv', headers: true) do |row|
#   Chcity2.create(
#     lati: row[1],
#     longi: row[2],
#     prov: row[3],
#     income:row[7],
#     r_price:row[8],
#     popul: row[4],
#     size: row[5],
#     dense:row[6],   
#     chcity_id: row[0],
#     latitude_id:row[9],
#     jpkanji:row[10]
#   )
# end

# CSV.foreach('db/jpcity2s.csv', headers: true) do |row|
#   Jpcity2.create(
#     lati: row[0],
#     longi: row[1],
#     pref: row[2],
#     income:row[4],
#     r_price:row[3],
#     popul: row[6],
#     size: row[7],
#     dense:row[8],
#     jpcity_id: row[5],
#     latitude_id:row[9],
#     jpkanji:row[10]
#   )
# end

CSV.foreach('db/latitudes.csv', headers: true) do |row|
  Latitude.create(
    lat_min: row[0],
    lat_max: row[1]
  )
end

CSV.foreach('db/chclimates.csv', headers: true) do |row|
  Chclimate.create(
    chcity_id: row[0],
    temp_ave: row[1],
    rain_total: row[7],
    warmin: row[9],
    cldiv_id:row[10],
    max_temp:row[2],
    max_temp_month: row[3],
    min_temp: row[4],
    min_temp_month: row[5],
    jpkanji:row[11],
    snow_total:row[8],
    middle_temp:row[6]
  )
end

CSV.foreach('db/jpclimates.csv', headers: true) do |row|
    Jpclimate.create(
      jpcity_id: row[0],
      temp_ave: row[1],
      rain_total: row[2],
      warmin: row[4],
      cldiv_id:row[5],
      max_temp:row[6],
      max_temp_month: row[7],
      min_temp: row[8],
      min_temp_month: row[9],
      jpkanji: row[11],
      snow_total:row[3],
      middle_temp:row[10]
    )
  end