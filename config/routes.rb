Rails.application.routes.draw do
  resources :posts
  resources :users
  resources :trails
  resources :resorts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
