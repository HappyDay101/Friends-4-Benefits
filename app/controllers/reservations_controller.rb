class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def new
    if params[:service_id]
      @service = Service.find(params[:service_id])
    else
      @service = Service.new
    end

    @reservation = Reservation.new
  end

  def create
    @service = Service.find(params[:service_id])
    @booking = current_user.bookings.new(booking_params.merge(service: @service))

    if @booking.save
      redirect_to @service, notice: 'Reservation successful.'
    else
      flash[:alert] = "Reservation failed: #{booking_errors_message}"
      redirect_to @service
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :comment)
  end

  def booking_errors_message
    @booking.errors.full_messages.join(', ')
  end
end
