require_relative '../../lib/json_web_token'

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


    @email = params[:email]
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
      render 'deck/all'
    else
      render status: 401, json: {message: 'Invalid email'}
    end
  end



  def destroy
    token_header = @request[:headers]['Authorization'].split(' ').last
    token = Token.where(token: token_header).first
    render status: 401, json: { message: 'Token is already deleted' } unless token
    token&.delete
    render status: 200, json: {message: 'User logged out successfully'}
    ##### should add a check to see if the token is already deleted
  end
end
