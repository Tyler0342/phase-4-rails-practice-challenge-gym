class GymsController < ApplicationController

    def index 
        render json: Gym.all, except: [:created_at, :updated_at]
    end

    def show 
        gym = Gym.find(params[:id])
        render json: gym, except: [:created_at, :updated_at]
    end

    def destroy 
        gym = Gym.find(params[:id]) 
        gym.destroy 
        render json: {}, status: :not_found
    end
end
