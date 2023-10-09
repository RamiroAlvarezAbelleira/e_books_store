class Api::V1::BooksController < Api::V1::BaseController
  before_action :set_book, only: %i[show update destroy]

  def index
    @books = policy_scope(Book)
      # @q = policy_scope(Book).ransack(params[:q])
      # @books = @q.result.paginate(page: params[:page], per_page: 5)
  end

  def show
    # @author = Author.where(id: @book.author_id)
    # @publisher = Publisher.where(id: @book.publisher_id)
  end

  def create
    @book = Book.new(book_params)
    authorize @book
    if @book.save
      render json: {
        message: 'Uploaded successfully.',
        book: @book
      }, status: :created
    else
      render_error
    end
  end

  def update
    if @book.update(book_params)
      render json: {
        message: 'Updated successfully',
        book: @book
      }, status: :ok
    else
      render_error
    end
  end

  def destroy
    @book.destroy
    head :no_content
  end

  private

  def set_book
    @book = Book.find(params[:id])
    authorize @book
  end

  def book_params
    params.require(:book).permit(:title, :author_id, :publisher_id, :isbn, :date_of_publication, :review, :price)
  end

  def render_error
    render json: { errors: @book.errors.full_messages },
           status: :unprocessable_entity
  end
end