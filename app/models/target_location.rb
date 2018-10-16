class TargetLocation < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  # validates :contact_name, presence: true
  # validates :phone, presence: true
  # validates :email, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  # validates :capacity, presence: true

  def contact_information
    [self.contact_name, self.phone, self.email].reject(&:blank?).join(", ")
  end
end
