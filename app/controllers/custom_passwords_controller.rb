class CustomPasswordsController < Devise::PasswordsController
    before_action :authorize_user
  
    private
  
    def authorize_user
      authorize User
    end
  end