Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations',
    sessions: 'auth/sessions',
  }

  as :user do
    # Define routes for User within this block.
  end
  root "home#index"

  namespace :admin do
    resources :authors, only: %i[index show new edit create update destroy]
    resources :publishers, only: %i[index show new edit create update destroy]
    resources :books, only: %i[index show new edit create update destroy]
  end

  resources :authors, only: [:index, :show]
  resources :publishers, only: [:index, :show]

end
