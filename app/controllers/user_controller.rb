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
