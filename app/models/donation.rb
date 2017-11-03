class Donation < ApplicationRecord
  validates :source_name, presence: true
  validates :source_address, presence: true
  validates :food_type, presence: true
  validates :information_source, presence: true

  validates :quantity, presence: true,
                       numericality: {greater_than_or_equal_to: 50}

end
