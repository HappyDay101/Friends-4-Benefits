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

  def create
    @service = current_user.services.new(service_params)
    if @service.save
      redirect_to service_path(@service), notice: "Service created successfully"
    else
      Rails.logger.debug(@service.errors.full_messages.to_sentence)
      flash.now[:alert] = @service.errors.full_messages.to_sentence
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

  def edit
    @service = Service.find(params[:id])
    redirect_to(root_path, alert: "Not authorized") unless current_user == @service.user
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      redirect_to service_path(@service), notice: "Service updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
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
