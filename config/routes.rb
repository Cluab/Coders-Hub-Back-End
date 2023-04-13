Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  use_doorkeeper
  devise_for :users
  
  draw :api

  root 'documentation#index', as: 'documentation'

  get '/documentation', to: 'documentation#index'
  get '/documentation/authentication', to: 'documentation#authentication'
  get '/documentation/users', to: 'documentation#users'
  get '/documentation/classes', to: 'documentation#classes'
  get '/documentation/reservations', to: 'documentation#reservations'
end
