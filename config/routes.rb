Rails.application.routes.draw do
  get 'user/create'
  get 'user/destroy'
  get 'user/index'
  get 'session/create'
  get 'session/destroy'
  get 'deck/index'
  get 'deck/create'
  get 'deck/all'
  get 'deck/where'
  get 'deck/destroy'
  get 'deck/update'
  post 'session/logged_in' => 'session#logged_in'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
