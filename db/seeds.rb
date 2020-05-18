# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "json"

state_data = File.read(Rails.root.join("db/json/states.json"))
states = JSON.parse(state_data)
created_states = {}
states.each do |state|
  new_state = State.create(
    name: state["name"],
    code: state["short"]
  )
  created_states[new_state.code] = new_state
end

city_data = File.read(Rails.root.join("db/json/cities.json"))
cities = JSON.parse(city_data)
cities.each do |city|
  target_state = created_states[city["state_id"]]
  next if target_state.nil?

  target_state
    .cities
    .create(
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
  target_state = created_states[ban["State"]]
  capitalized_city_name = ban["City"].split.map(&:capitalize).join(' ')
  city = target_state.cities.find_by(name: capitalized_city_name)
  next if city.nil? || city.ban.present?

  city.ban = Ban.create(
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

composter_data = File.read(Rails.root.join("db/json/composters.json"))
composters = JSON.parse(composter_data)
composters.each do |composter|
  city = City.find_by(latitude: composter["Lat"], longitude: composter["Longitude"])
  next if city.nil?

  city.composters.create(
    name: composter["Name"],
    url: composter["URL"],
    email: composter["Email"],
    phone: composter["Phone"],
    active: composter["In_Business"]
  )
end

facility_data = File.read(Rails.root.join("db/json/facilities.json"))
facilities = JSON.parse(facility_data)
facilities.each do |facility|
  facility_state = created_states[facility["State"]]
  city = City.find_by(
    name: facility["City"],
    state_id: facility_state.id
  )
  next if city.nil?

  city.facility = Facility.create(
    name: facility["Facility"],
    address: facility["Address"],
    postal_code: facility["Postal Code"],
    capability: facility["Capability"]
  )
end

customer_data = File.read(Rails.root.join("db/json/customers.json"))
customers = JSON.parse(customer_data)
customers.each do |customer|
  city = City.find_by(latitude: customer["lat"], longitude: customer["lng"])
  next if city.nil?

  city.customers.create(
    zip: customer["Zip Code"]
  )
end

