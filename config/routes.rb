Rails.application.routes.draw do
  post 'register', to: 'users#create'
  post 'login', to: 'users#login'

  get 'tweet', to: 'tweets#index'
  get 'tweet/:id', to: 'tweets#show'
  post 'tweet', to: 'tweets#create'
  put 'tweet/:id', to: 'tweets#update'
  delete 'tweet/:id', to: 'tweets#destroy'
end
