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

    # Convert the time strings to Time objects using Time.parse
    start_time = Time.parse(params[:booking][:start_time])
    end_time = Time.parse(params[:booking][:end_time])

    @booking = current_user.bookings.new(
      booking_params.merge(
        service: @service,
        start_date: start_time,
        end_date: end_time
      )
    )

    if @booking.save
      redirect_to dashboard_path, notice: 'Booking successful.'
    else
      flash[:alert] = "Booking failed: #{booking_errors_message}"
      redirect_to @service
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :service_id, :start_date, :end_date, :pickup_location, :pickup_date, :pickup_time, :dropoff_location, :dropoff_date, :dropoff_time)
  end

  def booking_errors_message
    @booking.errors.full_messages.join(', ')
  end
end
