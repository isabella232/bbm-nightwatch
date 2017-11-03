class CreateTransports < ActiveRecord::Migration[5.1]
  def change
    create_table :transports do |t|
      t.string :email
      t.string :name
      t.string :target_location
      t.belongs_to :donation

      t.timestamps
    end
  end
end
