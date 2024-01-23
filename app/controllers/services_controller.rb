class ServicesController < ApplicationController
  before_action :set_service, only: [:show]

  def index
    @services = Service.all
  end

  def show
  end

  private

  def set_service
    @service = Service.find_by(id: params[:id])
    unless @service
      flash.now[:alert] = "Service not found"
      redirect_to services_path
    end
  end
end
