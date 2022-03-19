class LeasesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create
        lease = Lease.create!(leases_params)
        render json: lease, status: :created
    end

    def destroy
        lease = Lease.find(params[:id])
        lease.destroy
        head :no_content
    end

    private

    def leases_params
        params.permit(:rent)
    end

    def render_not_found_response(invalid)
        render json { error: invalid.record.errors.full_messages }
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }
    end
end
