class Transport < ApplicationRecord
  belongs_to :donation
  belongs_to :transporter, class_name: "User"

  validates :donation, presence: true
  validates :name, presence: true
  validates :email, presence: true,
                    format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  validates :phone, presence: true

  after_create { donation.assign! }
end
