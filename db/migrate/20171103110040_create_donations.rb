class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.string :source_name
      t.string :source_address
      t.integer :quantity
      t.string :food_type
      t.boolean :anonymous
      t.string :information_source
      t.string :status

      t.timestamps
    end
  end
end
