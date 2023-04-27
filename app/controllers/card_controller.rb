class CardController < ApplicationController
  include AuthenticationConcern

  def create

    @token = @@token
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
    @token = @@token
    @deckid = params[:deck_ids]
    @cards = Card.where(deck_id: @deckid)
    render('card/all')
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
