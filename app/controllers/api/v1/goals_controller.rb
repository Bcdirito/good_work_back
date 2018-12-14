class Api::V1::GoalsController < ApplicationController
    def index
        render json: Goal.all
    end

    def create
        goal = Goal.create(goal_params)
        if goal.valid?
            render json: goal
        else
            render json: {"error" => goal.errors.full_messages}, status: 422
        end
    end

    def update
        goal = Goal.update(params[:id], goal_params)
        if goal.valid?
            render json: goal
        else
            render json: goal.errors.full_messages
        end
    end

    def destroy
        goal = Goal.find(params[:id])
        if goal.destroy
            render json: {"message" => "Goal Has Been Deleted"}
        else
            render json: {"error" => goal.errors.full_messages}, status: 409
        end
    end

    private

    def goal_params
        params.require(:goal).permit(:name, :user_id)
    end
end
