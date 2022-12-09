class PostsController < ApplicationController
  before_action :authorized, :set_post

  def index
    search = params[:search]
    if search.present?
      car_model = CarModel.where("name LIKE :search", search: "%#{search}%")
      manufacture = Manufacture.where("name LIKE :search", search: "%#{search}%")
      @pagy, @posts = pagy(Post.where(car_model_id: car_model).or(Post.where(manufacture_id: manufacture)).order('id DESC'), items: 3)
    else
      @pagy, @posts = pagy(Post.all.order('id DESC'), items: 3)
    end
    posts = []
    @posts.each do |post|
      posts << post_resource(post)
    end
    render json: { posts: posts, pagy: @pagy}
  end

  def new
    @manufacture = Manufacture.all
    @build_type = BuildType.all
    @model = CarModel.all
    render json: { manufacture: @manufacture, build_type: @build_type, model: @model }
  end

  def create
    byebug
    @post = Post.new(post_params)
    Image.create(src: params[:image], imageable: @post.id)
    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def show
    @posts = Post.where.not(id: @post.id).order('id DESC')
    posts = []
    @posts.each do |post|
      posts << post_resource(post)
    end
    render json: { post: post_resource(@post), posts: posts }
  end

  def edit
    @manufacture = Manufacture.all
    @build_type = BuildType.all
    @model = CarModel.all
    render json: { post: @post, manufacture: @manufacture, build_type: @build_type, model: @model }
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
    params.require(:post).permit(:condition, :trim_name, :engine_power, :transmission, :steering_position, :fuel_type, :color,
                  :price, :vin, :plate_number, :seat, :door, :description, :year, :phone, :address, :manufacture_id, :user_id, :car_model_id, :build_type_id, :image)
  end

  def post_resource(post)
    {
      id: post.id,
      condition: post.condition,
      manufacture: post.manufacture.name,
      car_model: post.car_model.name,
      price: post.price,
      fuel_type: post.fuel_type,
      transmission: post.transmission,
      user: post.user.name,
      build_type: post.build_type.name,
      trim_name: post.trim_name,
      engine_power: post.engine_power,
      steering_position: post.steering_position,
      color: post.color,
      vin: post.vin,
      plate_number: post.plate_number,
      seat: post.seat,
      door: post.door,
      description: post.description,
      year: post.year,
      phone: post.phone,
      address: post.address,
      created_at: post.created_at.strftime('%B %d, %Y')
    }
  end
end
