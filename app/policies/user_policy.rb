class UserPolicy < ApplicationPolicy
    class Scope < Scope
        # NOTE: Be explicit about which records you allow access to!
        def resolve
            scope.all
        end

        def index
            true
        end

        def create
            true
        end

        def update
            true
        end

        def show
            true
        end

        def destroy
            true
        end
    end
end