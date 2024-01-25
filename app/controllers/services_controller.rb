class ServicesController < ApplicationController
  before_action :set_service, only: [:show]
  skip_before_action :authenticate_user!, only: :index

  def index
    @services = Service.all
  end

  def show
    @service = Service.find_by(id: params[:id])
    @bookings = @service.bookings.includes(:user)
    @booking = Booking.new(
      pickup_location: "Default Pickup Location",
      pickup_date: Date.current, # Set default pickup date or initialize it based on your logic
      pickup_time: Time.current.strftime("%H:%M") # Set default pickup time or initialize it based on your logic
    ) # Change from @reservations to @bookings
  end

  private

  def set_service
    @service = Service.find_by(id: params[:id])
    unless @service
      flash[:alert] = "Service not found"
      redirect_to services_path and return
    end
  end
end
