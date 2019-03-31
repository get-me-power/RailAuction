class UserController < ApplicationController
  def new
    @user = User.new
  end

  def edit
  end

  def login
  end

  def create
    @user = User.new(name: params[:name], password: params[:password])
    @user.save
    redirect_to("/home/top")
  end
  
end
