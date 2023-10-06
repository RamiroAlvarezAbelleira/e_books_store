class CustomRegistrationsController < Devise::RegistrationsController
    before_action :authorize_user, only: %i[create update destroy]

    def new
        @user = User.new
        authorize @user
        super
    end

    private

    def authorize_user
        authorize User
    end
end