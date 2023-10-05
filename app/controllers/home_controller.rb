class HomeController < ApplicationController

    def index
        @authors = policy_scope(Author)
    end
    
end