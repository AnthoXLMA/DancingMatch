class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:query].present?
    # @dances = Dance.where(title: params[:query])
    @dances = Dance.where("title LIKE ?", "%" + params[:query] + "%")
    else
      @dances = Dance.all
    end
  end
end
