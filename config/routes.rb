Rails.application.routes.draw do

  get 'card/index'
  get 'card/all'
  get 'card/new'
  get 'card/destroy'
  post 'user/create'
  get 'user/destroy'
  get 'user/index'
  get 'session/create'
  get 'session/destroy'
  get 'deck/index'
  post 'deck/create'
  get 'deck/all'
  get 'deck/where'
  get 'deck/destroy'
  get 'deck/update'
  post 'session/logged_in' => 'session#logged_in'
  get 'session/logged_in' => 'session#dashboard'
  get 'deck/create' => 'deck#createView'
  post 'card/view', to: 'card#create', as: 'card_create'
  get 'card/view', to: 'card#view', as: 'card_view'


  root 'session#create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
