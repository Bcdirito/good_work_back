class PartnerMailer < ApplicationMailer

    def welcome_partner_email(partner, user)
        @partner = partner
        @user = user
        mail(to: `#{user.email}`, subject: "Welcome, Friend")
    end
end