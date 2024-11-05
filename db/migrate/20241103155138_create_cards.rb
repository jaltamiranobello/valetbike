class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :card_information
      t.boolean :verified
      t.integer :card_balance

      t.timestamps
    end
  end
end
