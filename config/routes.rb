Rails.application.routes.draw do
  # root "home#index"
  get '/', to: redirect('https://ski-me.herokuapp.com/')
  
  resources :posts
  resources :users
  resources :trails
  resources :resorts
end
