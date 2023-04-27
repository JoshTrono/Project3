class DeckController < ApplicationController
  helper_method :all
  include AuthenticationConcern

  def index
    @deck = Deck.where(user_id: params[:authorization][0][:user_id])
  end

  def createView
    @token = session[:token]
    render 'deck/create'
  end

  def create
    @token = session[:token]
    user_id = params[:authorization][0][:user_id]
    @deck = Deck.new
    @deck.name = params[:Deck_name]
    @deck.description = params[:Deck_description]
    @deck.user_id = user_id
    @deck.save
  end

  def all
    @token = session[:token]
    @deck = Deck.all
    render 'deck/all'
  end

  def where
  end

  def destroy
    Deck.destroy(params[:id])
    render('deck/all')
  end

  def update
  end
end
