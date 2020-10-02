class ProfilesController < ApplicationController
  def index
    @users = User.all
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

  def show
    @user = current_user
    @dances = Dance.all
    @dance = Dance.new
    @user_dances = @user.dances
    @chatrooms = Chatroom.all
    @salsa = Chatroom.find_by(name: "salsa")
    redirect_to chatroom_path(@salsa) if @salsa
  end

  def new
    @dance = Dance.new
    redirect_to user_path
  end

  def edit
    flash[:alert] = "alert"
    @user = current_user
    @dances = Dance.select('dances.*')
    @menu_dances = @user.dances
  end

  def ask_user
    @dances = Dance.all
    @my_dances = {}
    @your_dances = @dances.each do |dance|
     puts "#{dance}"
  end

  def chatroom
    general = Chatroom.find_by(name: "general")
    redirect_to chatroom_path(general) if general
  end

  def update
  end
end
  # def create
  #   @dances = Dance.all
  #   @my_dances = @dances.each do |title|
  #       puts "#{title}"
  #   end
  # end
    # @user_choice = nil
    #   until user_choice == "quit"
    #   puts "Fill your dances! (or quit)"
    #   print ">"
    #   user_choice = gets.chomp
    #   end
    #   if dance.key?(user_choice)
    #   puts "How many #{user_choice} do you want?"
    #   print ">"
    #   @user_quantity = gets.chomp.to_i
    #   my_dances[user_choice] = user_quantity
    #   puts "Your cart is #{cart}"

    #   elsif user_choice == "quit"
    #   puts "We're calculating your bill."
    #   else
    #   puts "Item is not in our store"
    #   end
    #   p my_dances
    #   # End the Loop
    #   end
    # end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to profile_path
  end

  private

  def user_params
    params.permit(:pseudo, :gender, :age, :location, :experience, :contact, :email, :dance, :id)
  end
end
