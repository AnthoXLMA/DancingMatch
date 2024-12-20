class ReviewsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @reviews = Review.all
  end

  def new
    @review = Review.new(new_review_params)
    @review.save
  end

  def create
    @users = User.all
    @user = User.find(params[:user_id])
    @review = Review.new(review_params)
    @review.user = @user
    if @review.save
      redirect_to user_profiles_path(@user, anchor: "review-#{@review.id}")
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  private

  def new_review_params
    params.permit(:content, :user_id)
  end

  def review_params
    params.require(:review).permit(:content, :user_id)
  end
end
