class UsersController < ApplicationController
  before_action :authorized, except: [:login, :create, :logout]
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end

  def create
    @user = User.create(user_params)
    if @user.save
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }, status: :created
    else  
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  def login
    
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: { data: { user: @user, token: token } }
    else
      render json: { error: "Email or Password incorrect" }, status: :unprocessable_entity
    end
   
  end

  def auto_login
    render json: @user
  end

  def edit
    render json: @user
  end

  def update
    if @user.update(user_params)
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

  def logout
    render json: { message: 'User was successfully logged out' }
  end

  private

    def set_user
      @user ||= User.find_by(id: params[:id])
    end
    def user_params
      params.permit(:name, :email, :password, :password_confirmation, :phone, :address)
    end
end
