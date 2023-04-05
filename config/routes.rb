Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

namespace :api do
  namespace :v1 do
    resources :items, only: [:index, :create, :show] do
      resources :reservations, only: [:create]
    end
    resources :reservations, only: [:index, :show], controller: 'reservations'
  end
end

end
