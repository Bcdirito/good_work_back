class ListMailer < ApplicationMailer

    def finished_list(list_name, goal_name, user)
        @list_name = list_name
        @goal_name = goal_name
        @user = user
        mail(to: @user.email, subject: "You Completed #{@list_name}!")
    end

    def finished_list_partner(list_name, user, partner)
        @list_name = list_name
        @user = user
        @partner = partner
        mail(to: @partner.email, subject: "#{@user.name} Completed #{@list_name}!")
    end
end