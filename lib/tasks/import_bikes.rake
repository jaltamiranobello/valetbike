namespace :db do

    desc "Creates the database from the data in notes/bike-data.csv"

    task :import_bikes => :environment do |task|
        require 'csv'
        puts "importing bikes data..."
        CSV.parse(File.read("notes/bike-data.csv"), headers: true).each do |row|
            puts "importing: #{row.to_hash["name"]}\n"
            item = row.to_hash
            bike = Bike.new({
            identifier: item["identifier"],
            current_station_id: item["current_station_identifier"]})
            if bike.save
                puts "Successfully imported: #{item["identifier"]}\n"
            else
                puts "Failed to import: #{item["identifier"]}\n"
            end
    
        end
    end
end