# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require 'csv'

CSV.foreach(Rails.root.join('notes/station-data.csv'), headers: true) do |row|
  Station.create(
    identifier: row['identifier'],
    name: row['name'],
    address: row['address'],
    latitude: row['latitude'],
    longitude: row['longitude'],
    has_kiosk: row['has_kiosk'] == "1",
    needs_maintenance: row['needs_maintenance'] == "1", 
    dock_count: row['dock_count'].to_i,
    docked_bike_count: row['docked_bike_count'].to_i
  )
end

