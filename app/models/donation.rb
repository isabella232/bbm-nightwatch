class Donation < ApplicationRecord
  has_many :transports
  belongs_to :user

  validates :contact_name, presence: true
  validates :contact_phone, presence: true
  validates :source_name, presence: true
  validates :source_address, presence: true
  validates :food_type, presence: true
  validates :available_from, presence: true
  validates :available_to, presence: true

  validates :quantity, presence: true,
            numericality: { greater_than_or_equal_to: 50 }

  state_machine initial: :reported, attribute: :status do
    event :assign do
      transition :reported => :assigned
    end

    event :finish do
      transition :assigned => :transported
    end

    event :miss do
      transition :reported => :missed
    end
  end

end
