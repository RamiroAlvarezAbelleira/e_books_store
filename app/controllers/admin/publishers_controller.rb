class Admin::PublishersController < ApplicationController
    before_action :set_publisher, only: %i[show edit update destroy]
  
      def index
          @publishers = policy_scope(Publisher)
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
  