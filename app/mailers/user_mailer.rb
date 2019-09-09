class UserMailer < ApplicationMailer

  def invite(user, poll)
    @user = user
    @poll = poll
    mail to: @user.email, subject: '🗳️ Cast your ballot'
  end

  def remind(user, polls)
    @user = user
    @polls = polls
    mail to: @user.email, subject: '🗳️ Cast your ballot'
  end

end
