class UserController < ApplicationController
  before_action :ensure_correct_user, {only: [:edit, :update]}

  def new
    @user = User.new
  end

  def index
    @users = User.all()
  end

  def login
    @user = User.find_by(login_params)

    if @user
      session[:user_id] = @user.id
      redirect_to("/posts/index")
    else
      @error_message = "ユーザー名，またはパスワードが間違っています"
      @name = params.require(:user).permit(:name)["name"]
      render("user/login_form")
    end
  end

  def login_params
    params.require(:user).permit(
      :email,
      :password
    )
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]

    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if @user.save
      flash[:notice] = "編集しました"
      redirect_to('/posts/index')
    else
      render('posts/edit')
    end

  end

  #ユーザーの新規登録を行う
  def create
    @user = User.new(create_params)
    @user.image_name = "default.jpg"
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/user/#{@user.id}")
    else
      session[:error] = @user.errors.full_messages
      redirect_to("/user/new")
    end
  end

  #User.newするときの引数の関数

  def create_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
    )
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしたで"
    redirect_to("/user/login")
  end

  def destroy
    user = User.find_by(id: session[:user_id])
    user.destroy
    session[:user_id] = nil
    flash[:notice] = "退会しました"
    redirect_to("/user/login")
  end

end
