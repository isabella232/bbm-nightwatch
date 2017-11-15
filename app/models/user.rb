class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :invitable, :async

  has_many :donations
  has_many :transports, foreign_key: :transporter_id

  validates :name, presence: true
  validates :phone, presence: true
end
