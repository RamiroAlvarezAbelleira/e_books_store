Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'custom_sessions',
    registrations: 'custom_registrations'
  }

  root "books#index"

  namespace :admin do
    resources :authors, only: %i[index show new edit create update destroy]
    resources :publishers, only: %i[index show new edit create update destroy]
    resources :books, only: %i[index show new edit create update destroy]
  end

  resources :books, only: [ :show]

end
