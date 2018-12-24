class PartnerMailer < ApplicationMailer

    def welcome_partner_email(partner, user)
        @partner = partner
        @user = user
        mail(to: `#{partner.email}`, subject: "Welcome, Friend")
    end
end