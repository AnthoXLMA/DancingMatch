# app/controllers/api/users_controller.rb
module Api
  class UsersController < Api::BaseController
    include Devise::Controllers::Helpers
    before_action :authenticate_user
    before_action :set_user, only: [:show, :update]

    # GET /api/users/:id
    def show
      @user = User.find(params[:id])
      render json: user
    end

    # PUT /api/users/:id
    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
        :first_name, :last_name, :age, :location, :city, :gender, :photo,
        :level, :xp, :coaching_status, :practice_a_week,
        :technique, :ambition, :social
      )
    end
  end
end
