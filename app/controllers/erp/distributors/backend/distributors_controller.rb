module Erp
  module Distributors
    module Backend
      class DistributorsController < Erp::Backend::BackendController
        before_action :set_distributor, only: [:show, :edit, :update, :destroy]
        before_action :set_distributors, only: [:delete_all]
        
        # GET /distributors
        def list
          @distributors = Distributor.all

          render layout: nil
        end

        # GET /distributors/1
        def show
        end

        # GET /distributors/new
        def new
          @distributor = Distributor.new

          if request.xhr?
            render '_form', layout: nil, locals: {distributor: @distributor}
          end
        end

        # GET /distributors/1/edit
        def edit
        end

        # POST /distributors
        def create
          @distributor = Distributor.new(distributor_params)
          @distributor.creator = current_user

          if @distributor.save
            if request.xhr?
              render json: {
                status: 'success',
                text: @distributor.id,
                value: @distributor.name
              }
            else
              redirect_to erp_distributors.edit_backend_distributor_path(@distributor), notice: 'Distributor was successfully created.'
            end
          else
            if request.xhr?
              render '_form', layout: nil, locals: {distributor: @distributor}
            else
              render :new
            end
          end
        end

        # PATCH/PUT /distributors/1
        def update
          if @distributor.update(distributor_params)
            if request.xhr?
              render json: {
                status: 'success',
                text: @distributor.id,
                value: @distributor.name
              }
            else
              redirect_to erp_distributors.edit_backend_distributor_path(@distributor), notice: 'Distributor was successfully updated.'
            end
          else
            render :edit
          end
        end

        # DELETE /distributors/1
        def destroy
          @distributor.destroy

          respond_to do |format|
            format.html { redirect_to erp_distributors.backend_distributors_path, notice: 'Distributor was successfully destroyed.' }
            format.json {
              render json: {
                'message': 'Distributor was successfully destroyed.',
                'type': 'success'
              }
            }
          end
        end

        def delete_all
          @distributors.destroy_all
          
          respond_to do |format|
            format.json {
              render json: {
                'message': 'Distributor was successfully destroyed all.',
                'type': 'success'
              }
            }
          end
        end

        private
          def set_distributor
            @distributor = Distributor.find(params[:id])
          end

          def set_distributors
            @distributor = Distributor.where(id: params[:ids])
          end

          # Only allow a trusted parameter "white list" through.
          def distributor_params
            params.fetch(:distributor, {}).permit(:name, :address, :image, :open_time, :latitude, :longitude)
          end

      end
    end
  end
end