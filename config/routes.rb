Rails.application.routes.draw do

  resources :items do
    resources :reservations, only: [:create]
  end
  get 'reservations', to: 'reservations#show'
  post '/reservations', to: 'reservations#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
