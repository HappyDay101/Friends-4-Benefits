class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :services, dependent: :destroy
  has_many :bookings, dependent: :destroy

  # custom validation
  # validates :username, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
