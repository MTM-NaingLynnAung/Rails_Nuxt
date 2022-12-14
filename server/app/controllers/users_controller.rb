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
    render json: {user: @user, image: @user.image}
  end

  def update
    if params[:image].present?
      @image = @user.build_image(src: params[:image])
    end
    
    if @user.update(user_params)
      if params[:image].present?
        image = Image.where(imageable_id: @user.id, imageable_type: 'User')
        image.each do |img|
          img.destroy
        end
        @image = @user.create_image(src: params[:image])
      end
      render json: @user, status: 200
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def change_password
    if @user && @user.authenticate(params[:old_pass])
      @user.update(user_params)
      if @user.valid?(:uploaded)
        render json: @user, status: 200
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Password Incorrect. Please try again' }, status: :unprocessable_entity
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
