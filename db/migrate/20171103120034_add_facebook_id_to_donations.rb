class AddFacebookIdToDonations < ActiveRecord::Migration[5.1]
  def up
    add_column :donations, :facebook_post_id, :integer
  end

  def down
    remove_column :donations, :facebook_post_id
  end
end
