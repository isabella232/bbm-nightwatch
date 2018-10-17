class SuccessStory < ApplicationRecord

  has_one_attached :image

  validates :contributor, presence: true
  validates :description, presence: true
  validates :title, presence: true, uniqueness: true
end