class GoalMailer < ApplicationMailer

    def finished_goal(goal_name, user)
        @goal_name = goal_name
        @user = user
        mail(to: @user.email, subject: "Wow! You Completed #{@goal_name}!")
    end

    def finished_goal_partner(goal_name, user, partner)
        @goal_name = goal_name
        @user = user
        @partner = partner
        mail(to: @partner.email, subject: "Wow! #{@user.name} Completed #{@goal_name}!")
    end
end