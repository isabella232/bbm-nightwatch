Rails.application.routes.draw do
  namespace :admin do
    resources :donations

    root to: "donations#index"
  end

  resources :donations, only: [:new, :create, :show, :index] do
    get :thank_you, on: :collection
    resources :transports, only: [:new, :create]
  end

  get '/healthcheck', to: 'health_check#index'

  root to: 'health_check#index'
end
