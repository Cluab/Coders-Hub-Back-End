Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      # get 'messages/random', to: 'messages#random'
      # resources :items, only: [:create]
      # get 'items/add', to: 'items#add'
      get 'items/all', to: 'items#all'
    end
  end
end
