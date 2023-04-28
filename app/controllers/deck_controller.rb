# Deck Controller
# This controller is responsible for handling all requests related to decks.
# It contains the following methods:
# 1. index
# 2. createView
# 3. create
# 4. all
# 5. where
# 6. destroy
# 7. update
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
    user_id = params[:authorization][0][:user_id]
    @deck = Deck.where(user_id: user_id)
    render 'deck/all'
  end

  def update
    @deck = Deck.find(params[:id])
    @deck.update(name: params[:Deck_name], description: params[:Deck_description])
    redirect_back(fallback_location: deck_all_path)
  end
  def edit
    @deck = Deck.find(params[:id])
    @deck_id = params[:id]
    render('deck/edit')
  end

  def where
  end

  def destroy
    Deck.destroy(params[:id])
    render('deck/all')
  end

end
