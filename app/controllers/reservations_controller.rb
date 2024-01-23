class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @service = Service.find(params[:service_id])
    @booking = current_user.bookings.new(booking_params.merge(service: @service))

    if @booking.save
      redirect_to @service, notice: 'Reservation successful.'
    else
      redirect_to @service, alert: 'Reservation failed.'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :comment)
  end
end
