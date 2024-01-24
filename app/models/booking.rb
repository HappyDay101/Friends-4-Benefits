class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :user_id, :service_id, :start_date, :end_date, :name, presence: true
  validate :start_date_before_end_date

  enum status: { pending: 0, confirmed: 1, canceled: 2 }

  private

  def start_date_before_end_date
    errors.add(:start_date, 'must be before end date') if start_date && end_date && start_date >= end_date
  end
end
