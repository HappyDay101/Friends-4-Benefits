class Review < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :rating, presence: true
end
