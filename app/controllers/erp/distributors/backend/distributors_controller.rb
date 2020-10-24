module Erp
  module Distributors
    module Backend
      class DistributorsController < ApplicationController
        before_action :set_distributor, only: [:show, :edit, :update, :destroy]

        # GET /distributors
        def index
          @distributors = Distributor.all
        end

        # GET /distributors/1
        def show
        end

        # GET /distributors/new
        def new
          @distributor = Distributor.new
        end

        # GET /distributors/1/edit
        def edit
        end

        # POST /distributors
        def create
          @distributor = Distributor.new(distributor_params)

          if @distributor.save
            redirect_to @distributor, notice: 'Distributor was successfully created.'
          else
            render :new
          end
        end

        # PATCH/PUT /distributors/1
        def update
          if @distributor.update(distributor_params)
            redirect_to @distributor, notice: 'Distributor was successfully updated.'
          else
            render :edit
          end
        end

        # DELETE /distributors/1
        def destroy
          @distributor.destroy
          redirect_to distributors_url, notice: 'Distributor was successfully destroyed.'
        end

        private
          # Use callbacks to share common setup or constraints between actions.
          def set_distributor
            @distributor = Distributor.find(params[:id])
          end

          # Only allow a trusted parameter "white list" through.
          def distributor_params
            params.fetch(:distributor, {})
          end
      end
    end
  end
end