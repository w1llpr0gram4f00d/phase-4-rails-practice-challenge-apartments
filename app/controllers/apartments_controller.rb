class ApartmentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def index
        apartments = Apartment.all
        render json: apartments, status: :ok
    end

    def create 
        apartment.create!(apartments_params)
        render json: apartment, status: :created
    end

    def update
        apartment = Apartment.find(params[:id])
        apartment.update(apartments_params)
        render json: apartment, status: :ok
    end

    def destroy
        apartment = Apartment.find(params[:id])
        apartment.destroy
        head :no_content
    end
    private
    
    def apartments_params
        params.permit(:number)
    end

    def render_not_found_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :not_found
    end

    def render_unprocessable_entity_found(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity 
    end 
end
