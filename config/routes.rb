Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#show'
  resources :users, only: [:create, :show]
  resources :cwallets, only: [:create] 
  resources :transactions, only: [:create]
  post '/filter' => 'transactions#filter'
  post '/session' => 'users#login'
  delete '/session' => 'users#logout'
end
