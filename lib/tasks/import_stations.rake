
namespace :db do
    task :import_stations => :environment do |task|
        require 'csv'
        puts "Getting information from the csv"
        CSV.parse(File.read("notes/station-data.csv"), headers: true).each do |row|
            station_info = row.to_hash
            station = Station.new({
                identifier: station_info["identifier"],
                name: station_info["name"],
                address: item})
    end
end