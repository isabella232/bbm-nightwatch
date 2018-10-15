class DropAccessTokensTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :access_tokens do |t|
      t.string "name"
      t.string "value"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
