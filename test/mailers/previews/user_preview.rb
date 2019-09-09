class UserPreview < ActionMailer::Preview

  def invite
    UserMailer.invite(User.first, User.first.polls.first)
  end

  def remind
    UserMailer.remind(User.first, User.first.reminders_due)
  end

end
