Rails.application.routes.draw do
  resources :food_recipes
  resources :recipes
  resources :users
  resources :foods
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
