require_relative '../../lib/json_web_token'

# Session Controller
# This controller is responsible for handling all requests related to sessions.
# It contains the following methods:
# 1. create
# 2. logged_in
# 3. destroy
class SessionController < ApplicationController

  def create

    render 'session/create'

    # user = User.where(username: params[:username]).first
    # if user&.authenticate(params[:password])
    #   if (tok = Token.where(user_id: user.id).first)
    #     puts "Deleting token #{tok.token}"
    #     tok.delete
    #   end
    #   random = SecureRandom.hex(32)
    #   token_value = JsonWebToken.encode({user_id: user.id, account_type: user.account_type, random: random})
    #   token = Token.create(token: token_value, user_id: user.id)
    #   render status: 201, json: {message: 'User logged in successfully', token: token.token, id: user.id, username: user.username, account_type: user.account_type}
    # else
    #   render status: 401, json: {message: 'Invalid email'}
    # end
  end

  def logged_in
    puts 'logged_in'
    @email = params[:email].downcase
    user = User.where(email: params[:email]).first
    if user&.authenticate(params[:password])
      if (tok = Token.where(user_id: user.id).first)
        puts "Deleting token #{tok.token}"
        tok.delete
      end
      token_value = JsonWebToken.encode({user_id: user.id, email: user.email})
      token = Token.create(token: token_value, user_id: user.id)
      @token = token.token
      @@token = @token
      session[:token] = @token
      @deck = Deck.all
      render 'deck/all'
    else
      render status: 401, json: {message: 'Invalid email'}
    end
  end



  def destroy
    token = Token.where(token: session[:token]).first
    token&.delete
    session[:token] = nil
    redirect_to root_path
    ##### should add a check to see if the token is already deleted
  end
end
