Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'home', to: 'home#index'
  get 'central/:id', to: 'centrals#show'
end
