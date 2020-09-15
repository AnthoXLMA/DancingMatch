class StylesController < ApplicationController
  def index
    @styles = Style.all
  end

  def new
    @style = Style.new
  end
end
