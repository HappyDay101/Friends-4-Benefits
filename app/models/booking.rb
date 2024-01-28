class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :user_id, :service_id, :start_date, :end_date, presence: true
  validate :start_date_before_end_date

  # enum status: { pending: 0, confirmed: 1, canceled: 2 }

  # New attributes for booking form in Service Show page
  # validates :pickup_location, :pickup_date, :pickup_time, :dropoff_location, :dropoff_date, :dropoff_time, presence: true

  attr_accessor :name, :email, :email_confirmation, :phone, :booking_date, :pickup_location, :pickup_date, :pickup_time, :dropoff_location, :dropoff_date, :dropoff_time

  private

  def start_date_before_end_date
    errors.add(:start_date, 'must be before end date') if start_date && end_date && start_date >= end_date
  end
end
