class Service < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  
  validates :service_name, :description, :category, :price, :location, presence: true
  # price validation
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  def picture_url
    picture.url
  end
end
