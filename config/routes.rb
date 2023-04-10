Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :items, only: %i[index show create destroy]
      get 'items', to: 'items#index'
      post 'items', to: 'items#create'
      get 'items/(:id)', to: 'items#show'
    end
  end
end
