Rails.application.routes.draw do

  resources :articles
  
  resources :comments
  
  get "sign_up" => "users#new", :as => "sign_up"
  resources :users
  
  get "login" => "sessions#new", :as => "login"
  post "create" => "sessions#create"
  get "logout" => "sessions#logout", :as => "logout"
  resources :sessions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "articles#index"
end
