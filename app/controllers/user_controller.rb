class UserController < ApplicationController
  def new
    @user = User.new
  end

  def edit
  end

  def login_form
  end

  def login
    @user = User.find_by(name: params[:name], password: params[:password])
    
    if @user
      session[:user_id] = @user.id
      redirect_to("/posts/index")
    else
      @error_message = "出直して，どうぞ"
      @name = params[:name]
      @password = params[:password]
      render("user/login_form")
    end
  end

  #ユーザーの新規登録を行う
  def create
    @user = User.new(create_params)
    @user.save
    redirect_to("/home/top")
  end
  
  #User.newするときの引数の関数
  def create_params
    params.require(:user).permit(
      :name,
      :password
      )
  end
end
