class Admin::AuthorsController < ApplicationController
    before_action :check_admin
    before_action :set_author, only: %i[show edit update destroy]

    def index
        @q = policy_scope(Author).ransack(params[:q])
        @authors = @q.result.paginate(page: params[:page], per_page: 5)
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
        respond_to do |format|
            if @author.save
                format.html { redirect_to admin_author_path(@author), notice: 'Successfully created a new author!' }
                format.json { render :show, status: :created, location: @author }
            else
                format.turbo_stream { render turbo_stream: turbo_stream.replace('error_messages', partial: "admin/authors/error_messages", locals: { author: @author }) }
                format.html { render :new }
                format.json { render_error }
            end
        end
    end

    def update
        respond_to do |format|
            if @author.update(author_params)
                format.html { redirect_to admin_author_path(@author), notice: 'Author updated successfully!' }
                format.json { render :show, status: :ok, location: @author}
            else
                format.turbo_stream { render turbo_stream: turbo_stream.replace('error_messages', partial: "admin/authors/error_messages", locals: { author: @author }) }
                format.html { render :edit }
                format.json { render_error }
            end
        end
    end

    def destroy
        @author.destroy
        respond_to do |format|
            format.html { redirect_to admin_authors_url }
            format.json { head :no_content}
        end
    end

    private

    def check_admin
        redirect_to root_path, alert: 'You are not authorized to access this page.' unless current_user && current_user.admin?
    end

    def set_author
        @author = Author.find(params[:id])
        authorize @author
    end

    def author_params
        params.require(:author).permit(:firstname, :lastname, :date_of_birth, :about, :nationality)
    end

    def render_error
        render json: @author.errors, status: :unprocessable_entity
    end
end
