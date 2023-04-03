Rails.application.routes.draw do
  namespace :api do
    get 'reservation/index'
    get 'item/index'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
