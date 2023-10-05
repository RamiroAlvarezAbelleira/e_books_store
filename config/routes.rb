Rails.application.routes.draw do
  mount_devise_token_auth_for 'Admin', at: 'admin_auth'

  mount_devise_token_auth_for 'User', at: 'auth'
  as :user do
    # Define routes for User within this block.
  end
  root "home#index"

  namespace :admin do
    resources :authors, only: %i[index show new edit create update destroy]
  end

  resources :authors, only: [:index, :show]

end
