class Donation < ApplicationRecord
  has_many :transports

  validates :contact_name, presence: true
  validates :contact_phone, presence: true
  validates :source_name, presence: true
  validates :source_address, presence: true
  validates :food_type, presence: true
  validates :available_from, presence: true
  validates :available_to, presence: true

  validates :quantity, presence: true,
            numericality: { greater_than_or_equal_to: 50 }

  validates :not_perishable, inclusion: { in: [true] }
end
