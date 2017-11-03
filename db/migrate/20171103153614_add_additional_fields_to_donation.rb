class AddAdditionalFieldsToDonation < ActiveRecord::Migration[5.1]
  def change
    change_table :donations do |t|
      t.rename :information_source, :contact_name
      t.column :contact_phone, :string
      t.column :comment, :text
      t.column :not_perishable, :boolean
      t.column :packaged, :boolean
    end
  end
end
