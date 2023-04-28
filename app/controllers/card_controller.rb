
# This controller is responsible for handling all the requests related to cards.
# It contains the following methods:
# 1. create
# 2. view
# 3. index
# 4. all
# 5. new
# 6. destroy
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

  def edit
    render('card/edit')
  end

  def update
    @card = Card.find(params[:id])
    @card.update(question: params[:question], description: params[:description])
    redirect_back(fallback_location: deck_all_path)
  end
  def new
  end

  def destroy
    @cards = Card.joins(:deck).where(decks: {user_id: params[:authorization][0][:user_id]}).all
    Card.destroy(params[:id])
    render('card/all')
  end
end
