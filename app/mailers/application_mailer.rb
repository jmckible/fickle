class ApplicationMailer < ActionMailer::Base
  default from: 'Fickle <postmaster@mailgun.jordanmckible.com>'
  layout 'mailer'
end
