# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "json"

city_data = File.read(Rails.root.join("db/json/cities.json"))
cities = JSON.parse(city_data)
cities.each do |city|
  City.create(
    county: city["county_name"],
    density: city["density"],
    latitude: city["lat"],
    longitude: city["lng"],
    name: city["city"],
    population: city["population"],
    zips: city["zips"]
  )
end

ban_data = File.read(Rails.root.join("db/json/bans.json"))
bans = JSON.parse(ban_data)
bans.each do |ban|
  capitalized_city_name = ban["City"].split.map(&:capitalize).join(' ')
  city = City.find_by(name: capitalized_city_name)
  next if city.nil?

  city.ban = Ban.create(
    city_id: city.id,
    enacted: ban["If applicable, date enacted "],
    proposed: ban["If applicable, date proposed"],
    ban_type: ban["Type"],
    stage: ban["Stage"]
  )
end

lobster_data = File.read(Rails.root.join("db/json/lobsters.json"))
lobsters = JSON.parse(lobster_data)
lobsters.each do |lobster|
  city = City.find_by(latitude: lobster["lat"], longitude: lobster["lng"])
  next if city.nil?

  city.lobsters.create(
    zip: lobster["Zip Code2"],
    address: lobster["Street Address"],
    phone: lobster["Primary Phone"]
  )
end