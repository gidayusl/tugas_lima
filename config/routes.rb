Rails.application.routes.draw do
  get "sign_up" => "users#new", :as => "sign_up"
  resources :users

  resources :articles
  
  resources :comments

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "articles#index"
end
