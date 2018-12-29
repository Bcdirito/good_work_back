class TaskMailer < ApplicationMailer

    def finished_task(task_title, list_name, user)
        @task_title = task_title
        @list_name = list_name
        @user = user
        mail(to: @user.email, subject: "You Completed #{@task_title}!")
    end

    def partner_finished_task(task_title, user, partner)
        @task_title = task_title
        @user = user
        @partner = partner
        mail(to: @partner.email, subject: "#{@user.name} Completed #{@task_title}!")
    end
end