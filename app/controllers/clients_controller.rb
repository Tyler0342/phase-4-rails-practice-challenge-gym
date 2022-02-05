class ClientsController < ApplicationController

    def index 
        render json: Client.all, except: [:created_at, :updated_at]#, methods: [:show_membership]
    end

    def show 
        client = Client.find(params[:id])
        render json: client, except: [:created_at, :updated_at], include: :show_membership
    end

    def update 
        client = Client.find(params[:id]) 
        client.update(client_params) 
        render json: client 
    end

        def show_membership 
        "$#{self.membership.sum(:charge)}"
    end

    private 

    def client_params 
        params.permit(:name, :age)
    end


end
