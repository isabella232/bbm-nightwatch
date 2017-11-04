class Transport < ApplicationRecord

  belongs_to :donation

  validates :donation, presence: true
  validates :name, presence: true
  validates :email, presence: true,
                    format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
end
