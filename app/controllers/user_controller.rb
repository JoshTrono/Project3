# Users controller
# This controller is responsible for handling all requests related to users.
# It contains the following methods:
# 1. create
# 2. view
class UserController < ApplicationController
  def create
    @user = User.new
    @user.email = params[:email].downcase
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
