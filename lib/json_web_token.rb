# frozen_string_literal: true
require 'jwt'

class JsonWebToken
  @hmac_secret = Rails.application.secret_key_base
  def self.encode(payload)
    token = JWT.encode payload, @hmac_secret, 'HS256'

  end

  #
  def self.decode(token)
    # decoded_token = JWT.decode(token, @hmac_secret, true, { algorithm: 'HS256' })[0]
    JWT.decode(token, @hmac_secret, true, {algorithm: 'HS256'})
  rescue JWT::ExpiredSignature, JWT::VerificationError => e
    raise JWT::ExpiredSignature, e.message
  rescue JWT::DecodeError, JWT::VerificationError => e
    raise JWT::DecodeError, e.message
  end
end