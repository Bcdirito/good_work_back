class Api::V1::GoalsController < ApplicationController
    def index
        goals = @user.goals.map do |goal|
            {id: goal.id, name: goal.name}
        end
        render json: goals
    end

    def create
        goal = Goal.create(goal_params)
        if goal.valid?
            goal_obj = {id: goal.id, name: goal.name}
            render json: goal_obj
        else
            render json: {"error" => goal.errors.full_messages}, status: 422
        end
    end

    def show
        goal = Goal.find(params[:id])
        
        goal.user_id == @user.id
        
        obj = {id: goal.id, name: goal.name}

        obj[:lists] = goal.lists.map do |ind|
            {id: ind.id, name: ind.name, tasks: ind.tasks}
        end

        render json: obj
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
        goal_name = goal.name
        user = goal.user
        partner = Partner.find_by(user_id: user.id)
        if goal.destroy
            if params[:complete] == true
                GoalMailer.finished_goal(goal_name, user).deliver_now
                if partner != nil
                    GoalMailer.finished_goal_partner(goal_name, user, partner).deliver_now
                end
            end
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
