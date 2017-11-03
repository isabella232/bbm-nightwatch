class ChangeFacebookPostIdType < ActiveRecord::Migration[5.1]
  def change
    change_table :donations do |t|
      t.change :facebook_post_id, :string
    end
  end
end
