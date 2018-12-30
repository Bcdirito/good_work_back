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

    def show
        render json: List.find(params[:id])
    end

    def destroy
        list = List.find(params[:id])
        list_name = list.name
        goal_name = list.goal.name
        user = list.goal.user
        partner = Partner.find_by(user_id: user.id)
        if list.destroy
            render json: {"message" => "List Has Been Deleted"}
            ListMailer.finished_list(list_name, goal_name, user).deliver_now
            if partner
                ListMailer.finished_list_partner(list_name, user, partner).deliver_now
            end
        else
            render json: {"error" => list.errors.full_messages}, status: 409
        end
    end

    private

    def list_params
        params.require(:list).permit(:name, :goal_id)
    end
end
