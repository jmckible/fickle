Rails.application.config.action_mailer.smtp_settings = Rails.application.credentials.dig(:smtp)
