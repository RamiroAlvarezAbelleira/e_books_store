class Admin::PublishersController < ApplicationController
  before_action :check_admin
  before_action :set_publisher, only: %i[show edit update destroy]

  def index
    @q = policy_scope(Publisher).ransack(params[:q])
    @publishers = @q.result.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def new
    @publisher = Publisher.new
    authorize @publisher
  end

  def edit
  end

  def create
    @publisher = Publisher.new(publisher_params)
    authorize @publisher
    respond_to do |format|
      if @publisher.save
        format.html { redirect_to admin_publisher_path(@publisher), notice: 'Successfully created a new publisher!' }
        format.json { render :show, status: :created, location: @publisher }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace('error_messages', partial: "admin/publishers/error_messages", locals: { publisher: @publisher }) }
        format.html { render :new }
        format.json { render_error }
      end
    end
  end

  def update
    respond_to do |format|
      if @publisher.update(publisher_params)
        format.html { redirect_to admin_publisher_path(@publisher), notice: 'Publisher updated successfully!' }
        format.json { render :show, status: :ok, location: @publisher}
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace('error_messages', partial: "admin/publishers/error_messages", locals: { publisher: @publisher }) }
        format.html { render :edit }
        format.json { render_error }
      end
    end
  end

  def destroy
    @publisher.destroy
    respond_to do |format|
      format.html { redirect_to admin_publishers_url }
      format.json { head :no_content}
    end
  end

  private

  def check_admin
    redirect_to root_path, alert: 'You are not authorized to access this page.' unless current_user && current_user.admin?
  end

  def set_publisher
    @publisher = Publisher.find(params[:id])
    authorize @publisher
  end

  def publisher_params
    params.require(:publisher).permit(:name)
  end

  def render_error
    render json: @publisher.errors, status: :unprocessable_entity
  end
end
  