namespace :api do
    namespace :v1 do
      scope :users, module: :users do
        post '/', to: 'registrations#create', as: :user_registration
      end
      get '/users/me', to: 'users#me'
      get '/items', to: 'items#index', as: :items
      post 'items', to: 'items#create'
      delete 'items/:id', to: 'items#destroy'
      get 'items/(:id)', to: 'items#show'
      get 'user/reservations', to: 'reservations#index'
      post 'user/reserve', to: 'reservations#create'
      get 'client/react'
    end
  end
  
  scope :api do
    scope :v1 do
      use_doorkeeper do
        skip_controllers :authorizations, :applications, :authorized_applications
      end
    end
  end