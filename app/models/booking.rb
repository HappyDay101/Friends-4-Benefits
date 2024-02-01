class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :user_id, :service_id, :start_date, :end_date, presence: true
  validate :start_date_before_end_date

  enum status: { pending: 'pending', booked: 'booked', declined: 'declined' }

  def pending?
    status.nil? || status == 'pending'
  end

  private

  def start_date_before_end_date
    errors.add(:start_date, 'must be before end date') if start_date && end_date && start_date >= end_date
  end
end
