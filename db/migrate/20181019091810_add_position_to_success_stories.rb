class AddPositionToSuccessStories < ActiveRecord::Migration[5.2]
  def change
    add_column :success_stories, :position, :integer, default: 1, null: false
  end
end