class ReviewsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @reviews = Review.all
  end

  def new
    @user =User.find(params[:id])
    @review = Review.new(review_params)
    @review.save
  end

  def create
    @user = User.find(params[:user_id])
    @review = Review.new(new_review_params)
    @review.user = @user
    if @review.save
      redirect_to user_profiles_path(@user)
    else
      render 'users/show'
    end
  end

  def destroy
    @review.destroy
  end

  private

  def set_review
    @review = User.reviews.find(params[:user_id])
  end

  def new_review_params
    params.permit(:content, :user_id)
  end

  def review_params
    params.require(:review).permit(:content, :user_id)
  end
end
