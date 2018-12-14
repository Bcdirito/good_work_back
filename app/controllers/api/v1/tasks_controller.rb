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

    private

    def task_params
        params.require(:task).permit(:title, :content, :list_id)
    end
end
