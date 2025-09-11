class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/:id
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "Utilisateur créé avec succès."
    else
      flash.now[:alert] = "Erreur lors de la création de l'utilisateur."
      render :new
    end
  end

  # GET /users/:id/edit
  def edit
  end

  # PATCH/PUT /users/:id
  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Utilisateur mis à jour avec succès."
    else
      flash.now[:alert] = "Erreur lors de la mise à jour de l'utilisateur."
      render :edit
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    redirect_to users_path, notice: "Utilisateur supprimé avec succès."
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
    unless @user
      redirect_to users_path, alert: "Utilisateur introuvable."
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :photo)
  end
end
