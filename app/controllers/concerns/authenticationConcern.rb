require_relative '../../../lib/json_web_token'


# this module is used to add the authorization header to the params
# this module is used in the controllers that need to access the authorization header
# this module is included in the application controller
module AuthenticationConcern
  extend ActiveSupport::Concern
  attr_accessor :authorization

  # add the before_action to the controller
  # this will run the add_auth_header_to_params method before any action in the controller
  included do
    before_action :add_auth_header_to_params
  end

  # add the authorization header to the params
  # if the authorization header is not present, return a 400 error
  # if the authorization header is not in the correct format, return a 400 error
  # if the authorization header is in the correct format, decode the token and add it to the params
  def add_auth_header_to_params
    if !request.headers['Authorization'].present?
      render status: 400, json: {message: 'No token provided'}
      return
    elsif request.headers['Authorization'].split(' ').length != 2
      render status: 400, json: {message: 'Invalid token for authorization'}
      return
    end

    auth_header = request.headers['Authorization'].split(' ')
    jwt = JsonWebToken.decode(auth_header[1]) if auth_header[0] == 'Bearer'
    params[:authorization] = jwt
  end

end