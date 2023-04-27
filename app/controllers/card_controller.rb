class CardController < ApplicationController
  include AuthenticationConcern

  def create

    @token = session[:token]
    # user_id = params[:authorization][0][:user_id]
    deck_id = params[:deck_ids]
    question = params[:question]
    description = params[:description]
    @card = Card.new
    @card.question = question
    @card.description = description
    @card.deck_id = params[:deck_ids]
    @card.save
  end

  def view
    @deckid = params[:deck_ids]
    render('card/create')
  end

  def index
    @token = session[:token]
    @deckid = params[:deck_ids]
    @cards = Card.where(deck_id: @deckid)
    render('card/index')
  end

  def all
    @token = session[:token]
    @deckid = params[:deck_ids]
    @cards = Card.joins(:deck).where(decks: {user_id: params[:authorization][0][:user_id]}).all
    render('card/all')
  end

  def new
  end

  def destroy
    @cards = Card.joins(:deck).where(decks: {user_id: params[:authorization][0][:user_id]}).all
    Card.destroy(params[:id])
    render('card/all')
  end
end
