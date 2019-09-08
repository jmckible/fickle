case Rails.env
when 'development'
  Rails.application.config.hosts << 'fickle.test'
when 'production'
  Rails.application.config.hosts << 'fickle.herokuapp.com'
end
