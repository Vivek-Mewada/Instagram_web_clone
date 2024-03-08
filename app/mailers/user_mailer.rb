class UserMailer < ApplicationMailer
    def mail_sender(user)
        mail(to: user.email, subject: "You got a reset password instruction!")
    end
end
