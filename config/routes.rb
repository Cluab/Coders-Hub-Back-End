Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    get 'reservation/show'
    namespace :v1 do
      get 'items', to: 'items#index'
      post 'items', to: 'items#create'
      get 'items/(:id)', to: 'items#show'
    end
  end
end
