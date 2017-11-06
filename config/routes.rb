Rails.application.routes.draw do
  namespace :admin do
    resources :donations
    resources :transports
    resources :users

    root to: "donations#index"
  end

  devise_for :users

  resources :donations, only: [:new, :create, :show, :index] do
    get :thank_you, on: :collection
    resources :transports, only: [:new, :create]
  end

  get '/healthcheck', to: 'health_check#index'

  root to: 'health_check#index'
end
