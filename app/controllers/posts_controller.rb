class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user_about_post, {only: [:edit, :update]}

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new()
  end

  def create
    @post = Post.new(content: params[:content], price: params[:price], product_name: params[:product_name], picture: "default.jpg", user_id: @current_user.id)
    if @post.save
      flash[:notice] = "投稿が完了しました"
      redirect_to("/posts/index")
    else
      session[:error] = @post.errors.full_messages
      redirect_to("/posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.product_name = params[:post][:product_name]
    @post.price = params[:post][:price]
    @post.content = params[:post][:content]

    if params[:post][:picture]
      print("image posted")
      @post.picture = "#{@post.id}.jpg"
      image = params[:post][:picture]
      File.binwrite("public/posts_images/#{@post.id}", image.read)
    end

    if @post.save
      flash[:notice] = "編集しました"
      redirect_to('/posts/index')
    else
      print("test")
      render('posts/edit')
    end
  end

  def post_params
    params.require(:post).permit(:product_name, :price, :content, :picture)
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end
end
