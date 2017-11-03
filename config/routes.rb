Rails.application.routes.draw do
  namespace :admin do
    resources :donations

    root to: "donations#index"
  end

  resources :donations do
    collection do
      get 'thank_you'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/healthcheck', to: 'health_check#index'

  root to: 'health_check#index'
end
