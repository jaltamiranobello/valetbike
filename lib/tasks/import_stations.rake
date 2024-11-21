namespace :db do

    desc "Creates the database from the data in "

    task :import_stations => :environment do |task|
        require 'csv'
        puts "importing station data..."
        CSV.parse(File.read("notes/station-data.csv"), headers: true).each do |row|
            puts "importing: #{row.to_hash["name"]}\n"
            item = row.to_hash
            station = Station.new({
            identifier: item["identifier"],
            name: item["name"],
            address: item["address"]})
            if station.save
                puts "Successfully imported: #{item["name"]}\n"
            else
                puts "Failed to import: #{item["name"]}\n"
            end
    
        end
    end
end