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

    private

    def goal_params
        params.require(:goal).permit(:name, :user_id)
    end
end
