class User < ApplicationRecord
  # attr_accessor :first_name, :last_name
  # commented that out to have the first and last names show on new users

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :services, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :bookings_as_owner, through: :services, source: :bookings
  has_one_attached :photo

  def full_name
    "#{first_name} #{last_name}"
  end
end
