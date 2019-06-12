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
    @post = Post.new(create_params)
    @post.picture = "default.jpg"
    @post.user = @current_user
    @post.endTime = Time.zone.local(params[:post]["endTime(1i)"].to_i, params[:post]["endTime(2i)"].to_i, params[:post]["endTime(3i)"].to_i)
    if @post.save
      flash[:notice] = "投稿が完了しました"
      redirect_to("/posts/index")
    else
      session[:error] = @post.errors.full_messages
      redirect_to("/posts/new")
    end
  end

  def create_params
    params.require(:post).permit(
      :content,
      :price,
      :product_name,
    )
  end


  def edit
    @post = Post.find_by(id: params[:id])
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(update_params)
    @post.endTime = Time.zone.local(params[:post]["endTime(1i)"].to_i, params[:post]["endTime(2i)"].to_i, params[:post]["endTime(3i)"].to_i)

    if params[:post][:picture]
      print("image posted")
      @post.picture = "#{@post.id}.jpg"
      image = params[:post][:picture]
      File.binwrite("public/posts_images/#{@post.picture}", image.read)
    end

    if @post.save
      flash[:notice] = "編集しました"
      redirect_to('/posts/index')
    else
      print("test")
      render('posts/edit')
    end
  end

  def update_params
    params.require(:post).permit(
      :content,
      :price,
      :product_name,
    )
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end
end
