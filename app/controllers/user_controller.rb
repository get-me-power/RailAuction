class UserController < ApplicationController
  def new
    @user = User.new
  end

  def edit
  end

  def login
  end
  #ユーザーの新規登録を行う
  def create
    @user = User.new(create_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/user/#{@user.id}")
    else
      render("user/new")
    end
  end

  #User.newするときの引数の関数
  def create_params
    params.require(:user).permit(
      :name,
      :password
    )
  end
end
