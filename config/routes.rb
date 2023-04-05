Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items do
        resources :reservations, only: [:create]
      end
    end
  end
end
