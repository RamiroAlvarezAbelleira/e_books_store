class Admin::AuthorsController < ApplicationController
  before_action :set_author, only: %i[show edit update destroy]

    def index
        @authors = policy_scope(Author)
    end

    def show
    end

    def new
        @author = Author.new
        authorize @author
    end

    def edit
    end

    def create
        @author = Author.new(author_params)
        authorize @author

        if @author.save
            redirect_to admin_author_path(@author), notice: 'Successfully created a new author!'
        else
            render :new
        end
    end

    def update
    end

    def destroy
    end

    private

    def set_author
        @author = Author.find(params[:id])
        authorize @author
    end

    def author_params
        params.require(:author).permit(:firstname, :lastname, :date_of_birth, :about, :nationality)
    end

    def render_error
    end
end
