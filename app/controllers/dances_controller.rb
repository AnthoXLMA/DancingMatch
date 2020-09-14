class DancesController < ApplicationController
  def index
    @dances = Dance.all
  end

  def show
    @dance = Dance.find(params[:id])
    # @partners = Partner.new
    # @partners = @dance.partners
  end

  def new
    @dance = Dance.new
  end

  def create
    @dance = Dance.new(dance_params)
    if @dance.save
      redirect_to dance_path(@dance)
    else
      render :new
    end
  end

  private

  def dance_params
    params.require(:dance).permit(:name)
  end
end
