class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new()
  end

  def create
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to("/posts/index")
  end

end