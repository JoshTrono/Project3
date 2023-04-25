class User < ApplicationRecord

  def authenticate(pass)
    pass == password
  end
end
