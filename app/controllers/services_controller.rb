class ServicesController < ApplicationController
  before_action :set_service, only: [:show]
  skip_before_action :authenticate_user!, only: :index

  def index
    @services = Service.all
    if params[:query].present?
      @services = @services.where(service_name: params[:query])
    end
  end

  def new
    @service = Service.new
  end

  # def create
  #   @service = List.new(service_params)
  #   if @service.save
  #     redirect_to services_path
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  def create
    @service = current_user.services.build(service_params)
    if @service.save
      redirect_to service_path(@service), notice: "Service created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @service = Service.find_by(id: params[:id])
    @bookings = @service.bookings.includes(:user)
    @booking = Booking.new()
    # review
    @reviews = @service.reviews.includes(:user)
    @review = Review.new
  end

  private

  def service_params
    params.require(:service).permit(:service_name, :location, :category, :description, :price, photos: [])
  end

  def set_service
    @service = Service.find_by(id: params[:id])
    unless @service
      flash[:alert] = "Service not found"
      redirect_to services_path and return
    end
  end
end
