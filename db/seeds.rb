# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

CSV.foreach('db/prefectures.csv', headers: true) do |row|
  Prefecture.create(id: row[0], name: row[1], sim_name: row[2])
end

CSV.foreach('db/provinces.csv', headers: true) do |row|
  Province.create(
    jpkanji: row[0],    
    simplified: row[1],
    pinyin: row[2]
  )
end

