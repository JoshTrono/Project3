class CardController < ApplicationController
  include AuthenticationConcern
  def create
    @token = @@token
  end

  def index
    @token = @@token
  end

  def all
    @token = @@token
    @cards = Card.joins(:deck).where(decks: {user_id: params[:authorization][0][:user_id]}).all
  end

  def new
  end

  def destroy
  end
end
