class Service < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :service_name, :description, :category, :price, :location, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  # review
  has_many :reviews, dependent: :destroy
  belongs_to :user

  SERVICE_CATEGORIES = ['Animal Buddy', 'Coding Buddy', 'Cult Buddy', 'Drink Buddy', 'Emo Buddy', 'Sports Buddy'].freeze
end
