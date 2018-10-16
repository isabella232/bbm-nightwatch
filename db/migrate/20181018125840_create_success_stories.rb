class CreateSuccessStories < ActiveRecord::Migration[5.1]
  def change
    create_table :success_stories do |t|
      t.string :image_path
      t.string :contributor
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end