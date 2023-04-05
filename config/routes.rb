Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'items', to: 'items#index'
      post 'items', to: 'items#create'
      post 'items', to: 'items#destroy'
      get 'items/(:id)', to: 'items#show'
      get 'items/(:id)/reservations', to: 'reservations#index'
      post 'items/(:id)/reservations', to: 'reservations#create'
    end
  end
end
