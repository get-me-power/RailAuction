class UserController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all()
  end

  def edit
  end

  def login
    @user = User.find_by(login_params)
    
    if @user
      session[:user_id] = @user.id
      redirect_to("/posts/index")
    else
      @error_message = "出直して，どうぞ"
      @name = params.require(:user).permit(:name)["name"]
      render("user/login_form")
    end
  end

  def login_params
    params.require(:user).permit(
      :name,
      :password
    )
  end

  #ユーザーの新規登録を行う
  def create
    @user = User.new(create_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/user/#{@user.id}")
    else
      redirect_to("/user/new")
    end
  end

  #User.newするときの引数の関数
  def create_params
    params.require(:user).permit(
      :name,
      :password
    )
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしたで"
    redirect_to("/user/login")
  end
end
