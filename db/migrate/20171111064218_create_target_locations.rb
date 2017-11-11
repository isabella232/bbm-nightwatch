class CreateTargetLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :target_locations do |t|
      t.string :name
      t.string :address
      t.string :contact_name
      t.string :phone
      t.string :email
      t.string :category
      t.integer :capacity
      t.integer :winter_capacity
      t.text :comment

      t.timestamps
    end
  end
end
