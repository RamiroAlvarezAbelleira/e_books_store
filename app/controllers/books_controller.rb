class BooksController < ApplicationController

    def index
        @books = policy_scope(Book).paginate(page: params[:page], per_page: 5)
    end

    def show
        @book = Book.find(params[:id])
        authorize @book
    end
end