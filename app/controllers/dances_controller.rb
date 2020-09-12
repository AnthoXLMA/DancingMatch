class DancesController < ApplicationController
  def index
  @dances = Dance.all
  end
end
