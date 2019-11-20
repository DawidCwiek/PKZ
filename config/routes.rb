Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'home', to: 'home#index'
  get '/central', to: 'centrals#user_central'
end
