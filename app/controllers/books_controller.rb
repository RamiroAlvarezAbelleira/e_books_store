class BooksController < ApplicationController

    def index
        if params[:query].present?
            @books = policy_scope(Book).search(params[:query]).paginate(page: params[:page], per_page: 5)
          else
            @books = policy_scope(Book).paginate(page: params[:page], per_page: 5)
          end
    end

    def show
        @book = Book.find(params[:id])
        authorize @book
    end
end