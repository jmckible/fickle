class UserPreview < ActionMailer::Preview

  def invited
    UserMailer.invite(User.first, User.first.polls.first)
  end

end
