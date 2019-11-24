Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'home', to: 'home#index'
  get '/central', to: 'centrals#user_central'
  get '/central/:central_id/menus', to: 'menus#index'
  get '/central/:central_id/menus/:menu_id', to: 'menus#show'
  post '/central/:central_id/menus', to: 'menus#create'
end
