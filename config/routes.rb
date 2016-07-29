Rails.application.routes.draw do

  resources :articles
  get "export_article" => "articles#export", :as => "export_article"
  
  resources :comments
  
  resources :users
  get "sign_up" => "users#new", :as => "sign_up"
  
  resources :sessions
  get "login" => "sessions#new", :as => "login"
  post "create" => "sessions#create"
  get "logout" => "sessions#logout", :as => "logout"
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "articles#index"
end
