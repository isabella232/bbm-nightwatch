class AddAvailableRangeAttributesToDonations < ActiveRecord::Migration[5.1]
  def change
    change_table :donations do |t|
      t.column :available_from, :datetime
      t.column :available_to, :datetime
    end
  end
end
