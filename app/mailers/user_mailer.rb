class UserMailer < ApplicationMailer

  def invite(user, poll)
    @user = user
    @poll = poll
    mail to: @user.email, subject: '🗳️ Cast your ballot'
  end

end
