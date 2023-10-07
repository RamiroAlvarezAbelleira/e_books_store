class Admin::BooksController < ApplicationController
    before_action :check_admin
    before_action :set_book, only: %i[show edit update destroy]

    def index
    @q = policy_scope(Book).ransack(params[:q])
    @books = @q.result.paginate(page: params[:page], per_page: 5)
    end

    def show
    end

    def new
        @book = Book.new
        @publishers = Publisher.pluck(:id, :name)
        @authors = Author.pluck(:id, :firstname)
        authorize @book
    end

    def edit
        @publishers = Publisher.pluck(:id, :name)
        @authors = Author.pluck(:id, :firstname)
    end

    def create
        @book = Book.new(book_params)
        authorize @book
        respond_to do |format|
            if @book.save
            # format.turbo_stream { render turbo_stream: turbo_stream.replace(@book, partial: "admin/books/form", locals: { book: @book }) }
            format.html { redirect_to admin_book_path(@book), notice: 'Successfully created a new book!' }
            format.json { render :show, status: :created, location: @book }
            else
            format.turbo_stream { render turbo_stream: turbo_stream.replace('error_messages', partial: "admin/books/error_messages", locals: { book: @book }) }
            format.html { render :new }
            format.json { render_error }
            end
        end
    end

    def update
        respond_to do |format|
            if @book.update(book_params)
                format.html { redirect_to admin_book_path(@book), notice: 'Book updated successfully!' }
                format.json { render :show, status: :ok, location: @book}
            else
            format.turbo_stream { render turbo_stream: turbo_stream.replace('error_messages', partial: "admin/books/error_messages", locals: { book: @book }) }
            format.html { render :edit }
            format.json { render_error }
            end
        end
    end

    def destroy
        @book.destroy
        respond_to do |format|
            format.html { redirect_to admin_books_url }
            format.json { head :no_content}
        end
    end

    private

    def check_admin
        redirect_to root_path, alert: 'You are not authorized to access this page.' unless current_user && current_user.admin?
    end

    def set_book
        @book = Book.find(params[:id])
        authorize @book
    end

    def book_params
        params.require(:book).permit(:title, :author_id, :publisher_id, :isbn, :date_of_publication, :review, :price)
    end

    def render_error
        render json: @book.errors, status: :unprocessable_entity
    end
end