Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'home', to: 'home#index'
  # central
  get '/central', to: 'centrals#user_central'
  post '/central/:central_id/store', to: 'centrals#create_store'
  # central menus
  get '/central/:central_id/menus', to: 'menus#index'
  get '/central/:central_id/menus/:menu_id', to: 'menus#show'
  post '/central/:central_id/menus', to: 'menus#create'
  put '/central/:central_id/menus/:menu_id', to: 'menus#update'
  delete '/central/:central_id/menus/:menu_id', to: 'menus#destroy'
  # central products
  get '/central/:central_id/products', to: 'products#index'
  get '/central/:central_id/products/:product_id', to: 'products#show'
  post '/central/:central_id/products', to: 'products#create'
  put '/central/:central_id/products/:product_id', to: 'products#update'
  delete '/central/:central_id/products/:product_id', to: 'products#destroy'
  # central components
  get '/central/:central_id/components', to: 'components#index'
  get '/central/:central_id/components/:component_id', to: 'components#show'
  post '/central/:central_id/components', to: 'components#create'
  put '/central/:central_id/components/:component_id', to: 'components#update'
  delete '/central/:central_id/components/:component_id', to: 'components#destroy'
end
