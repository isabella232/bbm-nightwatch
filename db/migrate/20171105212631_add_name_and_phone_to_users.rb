class AddNameAndPhoneToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :name
      t.string :phone
    end
  end
end
