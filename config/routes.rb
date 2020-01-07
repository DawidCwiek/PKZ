Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  # central
  get '/central', to: 'centrals#user_central'
  get '/active_menu/:store_id', to: 'centrals#active_menu'
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

  # orders
  post '/store/:store_id/orders', to: 'orders#create'
  put '/store/:store_id/orders/:order_id', to: 'orders#update_issued'
  get '/store/:store_id/orders/to_do', to: 'orders#to_do'

  mount ActionCable.server => '/cable'
end
