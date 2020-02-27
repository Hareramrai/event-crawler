Rails.application.routes.draw do
  root to: 'events#index'

  resources :events, only: %I[index show]

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
