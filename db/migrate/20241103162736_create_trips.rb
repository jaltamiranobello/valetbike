class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.integer :identifier
      t.integer :start_time
      t.integer :end_time

      t.timestamps
    end
  end
end
