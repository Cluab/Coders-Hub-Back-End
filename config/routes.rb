Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  use_doorkeeper
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :items, only: %i[index show create destroy]
      get 'items', to: 'items#index'
      post 'items', to: 'items#create'
      get 'items/(:id)', to: 'items#show'
    end
  end
  
  draw :api
end
