class RemoveImagePathFromSuccessStories < ActiveRecord::Migration[5.2]
  def change
    remove_column :success_stories, :image_path
  end
end
