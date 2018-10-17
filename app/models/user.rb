class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :invitable, :async

  has_many :donations
  has_many :transports, foreign_key: :transporter_id

  validates :name, presence: true

  scope :to_be_notified_in_email, -> { where email_notification: true }
  scope :admins, -> { User.select(&:admin?) }

  def admin?
    role == 'admin'
  end
end
