# class StylesController < ApplicationController
#   def index
#     @styles = Style.all
#   end

#   def create
#     @dance = Dance.find(params[:dance_id])
#     @style = Style.new(style_params)
#     @style.dance = @dance
#     if @style.save
#       redirect_to dance_path(@dance)
#     else
#       render 'dances/show'
#     end
#   end

#   def destroy
#     @style = Style.find(params[:id])
#     @dance = @style.dance
#     @style.destroy
#     redirect_to dance_path(@dance)
#   end
# end
