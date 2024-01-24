class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = Booking.all
  end

  def new
    if params[:service_id]
      @service = Service.find(params[:service_id])
    else
      @service = Service.new
    end

    @booking = Booking.new
  end

  def create
    @service = Service.find(params[:service_id])
    @booking = current_user.bookings.new(booking_params.merge(service: @service))

    if @booking.save
      redirect_to @service, notice: 'Booking successful.'
    else
      flash[:alert] = "Booking failed: #{booking_errors_message}"
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
