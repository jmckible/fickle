case Rails.env
when 'development'
  Rails.application.config.hosts << '73.170.93.96'
  Rails.application.config.hosts << 'fickle.ngrok.io'
  Rails.application.config.hosts << 'fickle.test'
when 'production'
  Rails.application.config.hosts << 'fickle.herokuapp.com'
end
