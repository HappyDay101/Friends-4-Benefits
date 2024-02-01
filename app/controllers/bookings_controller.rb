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
  end

  def booked
    update_status('booked')
  end

  def declined
    update_status('declined')
  end

  def update
    @booking = Booking.find(params[:id])
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to dashboard_path, notice: 'Booking status updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { redirect_to dashboard_path, alert: @booking.errors.full_messages.to_sentence }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def update_status(status)
    @booking = Booking.find(params[:id])
    if @booking.update(status: status)
      redirect_to dashboard_path, notice: 'Booking status updated.'
    else
      render :index, alert: 'could not update booking status.'
    end
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end

  def booking_errors_message
    @booking.errors.full_messages.join(', ')
  end
end
