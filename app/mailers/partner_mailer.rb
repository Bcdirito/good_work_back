class PartnerMailer < ApplicationMailer

    def welcome_partner_email(partner, user)
        @partner = partner
        @user = user
        mail(to: @partner.email, subject: "Welcome, Friend")
    end

    def partner_message(partner, user, subject, message)
        @partner = partner
        @user = user
        @subject = subject
        @message = message
        mail(to: @partner.email, subject: @subject)
    end
end