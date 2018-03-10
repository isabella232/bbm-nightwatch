require 'sidekiq/web'
Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  username == ENV["SIDEKIQ_USERNAME"] && password == ENV["SIDEKIQ_PASSWORD"]
end

Rails.application.routes.draw do
  namespace :admin do
    resources :donations
    resources :target_locations
    resources :transports
    resources :users

    root to: "donations#index"
  end

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :donations, only: [:new, :create, :show, :index] do
    get :thank_you, on: :collection
    resources :transports, only: [:new, :create]
  end

  resources :transports, only: [:index] do
    member do
      get :close
      patch :finish
    end
  end

  get '/healthcheck', to: 'health_check#index'

  root to: 'pages#landing'
  get '/home', to: 'pages#home'

  mount Sidekiq::Web => '/sidekiq'
end
