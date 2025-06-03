# app/controllers/api/base_controller.rb
module Api
  class BaseController < ApplicationController
    include Devise::Controllers::Helpers
    include ActionController::MimeResponds

    before_action :authenticate_user!

    protect_from_forgery with: :null_session

    respond_to :json
  end
end
