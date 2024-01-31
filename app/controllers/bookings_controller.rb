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

    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.service = @service

    if @booking.save
      redirect_to dashboard_path, notice: 'Booking successful.'
    else
      flash[:alert] = "Booking failed: #{booking_errors_message}"
      redirect_to @service
    end

    def accept
      update_status('accepted')
    end

    def reject
      update_status('rejected')
    end

    def update
      @booking = Booking.find(params[:id])
      if @booking.update(booking_params)
        redirect_to dashboard_path, notice: 'Booking Status Updated.'
      else
        flash[:alert] = "Failed to update booking status."
        redirect_to dashboard_path
      end
    end
  end

  private

  def update_status(status)
    @booking = Booking.find(params[:id])
    if @bookings.update(status: status)
      redirect_to dashboard_path, notice: 'Booking status updated.'
    else
      render :index, alert: 'could not update booking status.'
    end
  end

  def booking_params
    params.require(:booking).permit(:user_id, :service_id, :start_date, :end_date)
  end

  def booking_errors_message
    @booking.errors.full_messages.join(', ')
  end
end
