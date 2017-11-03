class CreateAccessTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :access_tokens do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
