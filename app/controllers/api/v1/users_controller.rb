class Api::V1::UsersController < ApplicationController
    def index
        render json: User.all
    end
    
    def create
        user = User.create(user_params)        
        if user.valid?
            render json: user
        else
            render json: {"error" => user.errors.full_messages}, status: 422
        end
    end

    def update
        user = User.update(params[:id], user_params)
        if user.valid?
            render json: user
        else
            render json: user.errors.full_messages
        end
    end

    def destroy
        user = User.find(params[:id])
        if user.destroy
            render json: {"message" => "Account Has Been Deactivated"}
        else
            render json: {"error" => user.errors.full_messages}, status: 409
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password_digest, :email)
    end
end
