require "administrate/field/base"

class SuccessStoryImageField < Administrate::Field::Base
  def show_image
    data
  end

  def select_from
    SuccessStory.all.map(&:image_path)
  end
end
