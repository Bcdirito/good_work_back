class Api::V1::UsersController < ApplicationController
    def create
        user = User.create(user_params)
        
    end

    private

    def user_params
        params.require(:user).permit(:username, :password_digest, :email, :partner_id)
    end
end
