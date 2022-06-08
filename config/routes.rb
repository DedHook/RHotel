Rails.application.routes.draw do
  resources :histories
  resources :rooms
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :friends
  # get 'home/index'
  get "home/about"
  

  root :to => 'home#index'  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
