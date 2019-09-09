task reminder: :environment do

  User.all.each do |user|
    if user.reminders_due.any?
      UserMailer.remind(user, user.reminders_due).deliver_now
    end
  end

end
