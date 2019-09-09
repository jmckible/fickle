ActionMailer::Base.smtp_settings = {
  address:        Rails.application.credentials.dig(:mailgun, :address),
  port:           Rails.application.credentials.dig(:mailgun, :port),
  user_name:      Rails.application.credentials.dig(:mailgun, :user_name),
  password:       Rails.application.credentials.dig(:mailgun, :password),
  domain:         Rails.application.credentials.dig(:mailgun, :domain),
  authentication: Rails.application.credentials.dig(:mailgun, :authentication)
}
