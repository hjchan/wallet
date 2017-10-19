Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#show'
  resources :users, only: [:create, :show]
  resources :cwallets, only: [:create] 
  resources :transactions, only: [:create, :edit, :update, :destroy]
  resources :sessions, only: [:create, :destroy]
  get '/buy' => 'transactions#buy', as: 'buy'
  get '/sell' => 'transactions#sell', as: 'sell'
  post '/filter' => 'transactions#filter'
  post '/login' => 'users#login', as: 'login'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'
end
