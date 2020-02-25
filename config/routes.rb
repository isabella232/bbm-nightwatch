Rails.application.routes.draw do
  namespace :admin do
    resources :donations
    resources :target_locations
    resources :transports
    resources :users
    resources :subscribers
    resources :success_stories

    root to: "donations#index"
  end

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :donations, only: [:new, :create, :show, :index, :destroy] do
    collection do
      get :thank_you
      get :my
      get :archive
    end
    resources :transports, only: [:new, :create]
  end

  resources :transports, only: [:index] do
    member do
      get :close
      patch :finish
      delete :cancel
    end
  end

  resources :target_locations, only: [:index]

  resources :subscribers, only: [:new, :create]

  get '/healthcheck', to: 'health_check#index'

  root to: 'pages#landing'
  get '/home', to: 'pages#home'
end
