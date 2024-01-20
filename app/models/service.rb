class Service < ApplicationRecord
  belongs_to :user

  validates :service_name, :description, :category, :price, :location, presence: true
end
