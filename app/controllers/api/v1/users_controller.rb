class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index
        render json: User.all
    end
    
    def create
        user = User.create(user_params)
        if user.valid?
            token = encode_token(user_id: user.id)
            render json: {user: UserSerializer.new(user), jwt: token }, status: :created
        else
            render json: {"error" => user.errors.full_messages}, status: 422
        end
    end

    def profile
        user = current_user
        render json: { user: UserSerializer.new(user)}, status: :accepted
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
