module Erp
  module Distributors
    module Backend
      class DistributorsController < Erp::Backend::BackendController
        before_action :set_distributor, only: [:archive, :unarchive, :show, :edit, :update, :destroy]
        before_action :set_distributors, only: [:delete_all, :archive_all, :unarchive_all]

        # GET /distributors
        def list
          @distributors = Distributor.all.paginate(:page => params[:page], :per_page => 10)

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
                text: @distributor.name,
                value: @distributor.id
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
                text: @distributor.name,
                value: @distributor.id
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

         # Archive /distributor/archive?id=1
         def archive
          @distributor.archive

          respond_to do |format|
          format.json {
            render json: {
            'message': 'Thông tin cửa hàng đã được ngưng sử dụng',
            'type': 'success'
            }
          }
          end
        end

        # Unarchive /distributor/unarchive?id=1
        def unarchive
          @distributor.unarchive

          respond_to do |format|
          format.json {
            render json: {
            'message': 'Thông tin cửa hàng đã được sử dụng lại',
            'type': 'success'
            }
          }
          end
        end

        # Archive /distributors/archive_all?ids=1,2,3
        def archive_all
          @distributors.archive_all

          respond_to do |format|
            format.json {
              render json: {
                'message': t('.success'),
                'type': 'success'
              }
            }
          end
        end

        # Unarchive /distributors/unarchive_all?ids=1,2,3
        def unarchive_all
          @distributors.unarchive_all

          respond_to do |format|
            format.json {
              render json: {
                'message': t('.success'),
                'type': 'success'
              }
            }
          end
        end

        def dataselect
          respond_to do |format|
            format.json {
              render json: Distributor.dataselect(params[:keyword])
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
            params.fetch(:distributor, {}).permit(:name, :address, :image, :open_time, :latitude, :longitude, :phone, :district_id, :state_id)
          end

      end
    end
  end
end