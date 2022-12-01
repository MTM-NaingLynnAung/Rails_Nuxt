class UsersController < ApplicationController
  before_action :set_user
  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    @user.id = session[:user_id]
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user
      @user.update(name: params[:name], email: params[:email])
      render json: @user, status: 200
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    if @user
      @user.destroy
      render json: { message: 'User was successfully destroy' }, status: 200
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    def set_user
      @user = User.find_by(id: params[:id])
    end
    # def user_params
    #   params.require(:user).permit(:name, :email, :password, :password_confirmation)
    # end
end
