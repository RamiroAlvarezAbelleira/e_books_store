class PublishersController < ApplicationController

    def index
        @publishers = policy_scope(Publisher)
    end

    def show
    end

end
