class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update]}


  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new()
  end

  def create
    @post = Post.new(content: params[:content], price: params[:price], product_name: params[:product_name])
    if @post.save
      flash[:notice] = "投稿が完了しました"
      redirect_to("/posts/index")
    else
      session[:error] = @post.errors.full_messages
      redirect_to("/posts/new")
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "編集しました"
      redirect_to('/posts/index')
    else
      render('posts/edit')
    end
  end

  def post_params
    params.require(:post).permit(:product_name, :price, :content)
  end
end



