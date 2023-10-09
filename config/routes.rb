require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'custom_sessions',
    registrations: 'custom_registrations',
    passwords: 'custom_passwords'
  }

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  root "books#index"

  namespace :admin do
    resources :authors, only: %i[index show new edit create update destroy]
    resources :publishers, only: %i[index show new edit create update destroy]
    resources :books do
      put :update_prices, on: :collection
    end
    resources :books, only: %i[index show new edit create update destroy]
  end

  resources :books, only: [ :show]

end
