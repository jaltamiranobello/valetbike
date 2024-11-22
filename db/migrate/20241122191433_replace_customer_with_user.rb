class ReplaceCustomerWithUser < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :user_id, :integer
    remove_column :trips, :customer_id
  end
end
