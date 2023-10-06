Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'custom_sessions',
    registrations: 'custom_registrations'
  }

  root "home#index"

  namespace :admin do
    resources :authors, only: %i[index show new edit create update destroy]
    resources :publishers, only: %i[index show new edit create update destroy]
    resources :books, only: %i[index show new edit create update destroy]
  end

  resources :authors, only: [:index, :show]
  resources :publishers, only: [:index, :show]

end
