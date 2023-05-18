class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::StatementInvalid, with: :invalid

    private

    def record_not_found
        render json: { error: 'Record Not Found.' }, status: 404
    end

    def invalid
        render json: {error: 'Wrong parameters.'}, status: 400
    end
end
