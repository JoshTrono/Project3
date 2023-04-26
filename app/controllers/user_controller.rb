class UserController < ApplicationController
  def create
    @user = User.new
    @user.email = params[:email].lowercase
    @user.password = params[:password]
    @user.save
  end
  def view
    render 'user/create'
  end
  def destroy
  end

  def index
  end


end
