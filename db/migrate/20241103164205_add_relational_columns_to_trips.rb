class AddRelationalColumnsToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :start_staion_id, :integer
    add_column :trips, :end_station_id, :integer
    add_column :trips, :bike_used_id, :integer
    add_column :trips, :customer_id, :integer
  end
end
