class AddUserIdToDonationsAndTransports < ActiveRecord::Migration[5.1]
  def change
    change_table :donations do |t|
      t.belongs_to :user
    end
    change_table :transports do |t|
      t.belongs_to :transporter
    end
  end
end
