class PostsController < ApplicationController
  before_action :authorized, :set_post

  def index
    @posts = Post.all
    render json: @posts
  end

  def new
    @manufacture = Manufacture.all
    @build_type = BuildType.all
    render json: { manufacture: @manufacture, build_type: @build_type } 
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def show
  end

  def update
    if @post.update(post_params)
      render json: @post, status: 200
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @post
      @post.destroy
      render json: { message: 'Post was successfully destroy' }, status: 200
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private

    def set_post
      @post = Post.find_by(id: params[:id])
    end

    def post_params
      params.permit(:condition, :trim_name, :engine_power, :steering_position, :fuel_type, :color, :price, :vin, :plate_number, :seat, :door, :description, :year, :phone, :address, :manufacture_id, :user_id, :car_model_id, :build_type_id)
    end

end
