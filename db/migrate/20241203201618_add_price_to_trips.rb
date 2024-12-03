class AddPriceToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :price, :float
  end
end
