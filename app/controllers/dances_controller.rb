class DancesController < ApplicationController
  def index
    @dances = Dance.all
  end

  def show
    @dance = Dance.find(params[:id])
    @dance = Dance.new
    @dancers = @dance.dancers
  end
end
