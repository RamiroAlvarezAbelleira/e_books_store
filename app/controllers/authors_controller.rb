class AuthorsController < ApplicationController

    def index
        @authors = policy_scope(Author)
    end

    def show
    end

end
