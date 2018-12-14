class Api::V1::ListsController < ApplicationController
    def index
        render json: List.all
    end

    def create
        list = List.create(list_params)
        if list.valid?
            render json: list
        else
            render json: {"error" => list.errors.full_messages}, status: 422
        end
    end

    def update
        list = List.update(params[:id], list_params)
        if list.valid?
            render json: list
        else
            render json: {"error" => list.errors.full_messages}, status: 422
        end
    end

    def destroy
        list = List.find(params[:id])
        if list.destroy
            render json: {"message" => "List Has Been Deletes"}
        else
            render json: {"error" => list.errors.full_messages}, status: 409
        end
    end

    private

    def list_params
        params.require(:list).permit(:name, :goal_id)
    end
end
