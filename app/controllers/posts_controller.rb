class PostsController < ApplicationController
  before_action :authenticate_user

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new()
  end

  def create
    @post = Post.new(content: params[:content], price: params[:price], product_name: params[:product_name])
    @post.save
    redirect_to("/posts/index")
  end

  def edit
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

end
