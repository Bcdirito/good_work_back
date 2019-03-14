class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        @user = User.find_by(username: user_login_params[:username])
        byebug
        if @user.authenticate(user_login_params[:password_digest])
            token = encode_token({ user_id: @user.id})
            render json: { user: UserSerializer.new(@user), jwt: token, partner: @user.partner}, status: :accepted
        elsif params[:user][:doctors]
            token = encode_token({ user_id: @user.id})
            render json: { user: UserSerializer.new(@user), jwt: token, partner: @user.partner}, status: :accepted
        else
            render json: { message: "Invalid username or password"}, status: :unauthorized
        end
    end

    private

    def user_login_params
        params.require(:user).permit(:username, :password_digest, :partner)
    end
end
