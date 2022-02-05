class ApplicationController < ActionController::API
     rescue ActiveRecord::RecordInvalid => invalid 
     render json: {errors: invalid.record.errors}, status: :unprocessable_entity

     rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

     private 

     def render_unprocessable_entity_response(invalid) 
         render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

     def render_not_found_response
         render json: { error: "not found" }, status: :not_found
  end
end
