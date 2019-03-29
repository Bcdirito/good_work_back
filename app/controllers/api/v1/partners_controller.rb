class Api::V1::PartnersController < ApplicationController
    def index
        if @user.partner
            partner_obj = {name: @user.partner.name, email: @user.partner.email}
            render json: partner_obj
        else
            render json: {"message" => "No Partner Found!"}
        end
    end

    def create
        partner = Partner.new(partner_params)
        partner[:user_id] = @user.id
        partner.save
        if partner.valid?
            partner_obj = {name: partner.name, email: partner.email}
            render json: partner_obj
            user = partner.user
            PartnerMailer.welcome_partner_email(partner, user).deliver_now
        else
            render json: {"error" => partner.errors.full_messages}, status: 422
        end
    end

    def update
        partner = @user.partner
        partner.update(partner_params)
        if partner.valid?
            partner_obj = {name: partner.name, email: partner.email}
            render json: partner_obj
        else
            render json: {"error" => partner.errors.full_messages}
        end
    end

    def destroy
        partner = @user.partner
        if partner.destroy
            render json: {"message" => "Partner Has Been Deleted"}
        else
            render json: {"error" => partner.errors.full_messages}, status: 409
        end
    end

    def message
        partner = Partner.find(params[:id])
        user = partner.user
        subject = params[:subject]
        message = params[:message]
        if partner
            render json: {"message" => "Message Sent!"}
            PartnerMailer.partner_message(partner, user, subject, message).deliver_now
        else
            render json: {"error" => partner.errors.full_messages}, status: 400
        end
    end

    private

    def partner_params
        params.require(:partner).permit(:name, :email)
    end
end
