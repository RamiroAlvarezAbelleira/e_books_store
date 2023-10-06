class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
    before_action :authorize_user, only: [:create, :update, :destroy]
  
    def create
      super
    end
  
    def update
      super
    end
  
    def destroy
      super
    end
  
    private
  
    def authorize_user
        authorize User
    end
  end