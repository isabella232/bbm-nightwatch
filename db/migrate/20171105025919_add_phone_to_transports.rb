class AddPhoneToTransports < ActiveRecord::Migration[5.1]
  def change
    change_table :transports do |t|
      t.column :phone, :string
    end
  end
end
