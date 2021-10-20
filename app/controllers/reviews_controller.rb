class ReviewsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @users = User.all
    @user = User.find(params[:user_id])
    @review = Review.new(review_params)
    @review.user = @user
    if @review.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def set_review
    @review = Review.find(params[:user_id])
  end

  def new_review_params
    params.permit(:content, :user_id, :review)
  end

  def review_params
    params.require(:review).permit(:content, :user_id)
  end
end
