class SuccessStory < ApplicationRecord
  validates :contributor, presence: true
  validates :description, presence: true
  validates :title, presence: true, uniqueness: true
end