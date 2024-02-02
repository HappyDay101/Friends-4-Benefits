# reviews_controller.rb
class ReviewsController < ApplicationController
  before_action :authenticate_user!


  def create
      @service = Service.find(params[:service_id])
      @booking = Booking.new
      @review = @service.reviews.new(review_params)
      @review.user = current_user

        if @review.save
          redirect_to @service, notice: 'Review successfully added.'
        else
          flash[:alert] = 'Failed to add review.'
        puts @review.errors.full_messages
        render 'services/show'
      end
    end


    private

    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
