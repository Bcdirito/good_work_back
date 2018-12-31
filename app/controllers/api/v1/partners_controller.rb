class Api::V1::PartnersController < ApplicationController
    def index
        render json: Partner.all
    end

    def create
        partner = Partner.create(partner_params)
        if partner.valid?
            render json: partner
            user = partner.user
            PartnerMailer.welcome_partner_email(partner, user).deliver_now
        else
            render json: {"error" => partner.errors.full_messages}, status: 422
        end
    end

    def update
        partner = Partner.update(params[:id], partner_params)
        if partner.valid?
            render json: partner
        else
            render json: {"error" => partner.errors.full_messages}
        end
    end

    def destroy
        partner = Partner.find(params[:id])
        if partner.destroy
            render json: {"message" => "partner Has Been Deleted"}
        else
            render json: {"error" => partner.errors.full_messages}, status: 409
        end
    end

    private

    def partner_params
        params.require(:partner).permit(:name, :email, :user_id)
    end
end
