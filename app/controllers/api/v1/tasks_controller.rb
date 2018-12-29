class Api::V1::TasksController < ApplicationController
    def index
        render json: Task.all
    end

    def create
        task = Task.create(task_params)
        if task.valid?
            render json: task
        else
            render json: {"error" => task.errors.full_messages}, status: 422
        end
    end

    def update
        task = Task.update(params[:id], task_params)
        if task.valid?
            render json: task
        else
            render json: task.errors.full_messages
        end
    end

    def destroy
        task = Task.find(params[:id])
        task_title = task.title
        list_name = task.list.name
        user = task.list.goal.user
        partner = Partner.find_by(user_id: user.id)
        if task.destroy
            render json: {"message" => "Task Has Been Deleted"}
            TaskMailer.finished_task(task_title, list_name, user).deliver_now
            if partner
                TaskMailer.partner_finished_task(task_title, user, partner).deliver_now
            end
        else
            render json: {"error" => task.errors.full_messages}, status: 409
        end
    end

    private

    def task_params
        params.require(:task).permit(:title, :content, :list_id)
    end
end
