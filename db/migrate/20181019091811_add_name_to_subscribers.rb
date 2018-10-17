class AddNameToSubscribers < ActiveRecord::Migration[5.2]
  def change
    add_column :subscribers, :name, :string
  end
end
