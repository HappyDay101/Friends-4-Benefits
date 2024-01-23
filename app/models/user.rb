class User < ApplicationRecord
  attr_accessor :first_name, :last_name

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :services, dependent: :destroy
  has_many :bookings, dependent: :destroy

  # custom validation

  def full_name
    "#{first_name} #{last_name}"
  end
end
