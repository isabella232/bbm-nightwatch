class Donation < ApplicationRecord
  include ActiveModel::Validations

  validates_presence_of :source_name, :source_address, :quantity, :food_type, :anonymous, :information_source, :status
  validates_numericality_of :quantity, greater_than_or_equal_to: 50
end
