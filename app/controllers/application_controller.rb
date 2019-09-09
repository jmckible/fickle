class ApplicationController < ActionController::Base
  include Authentication, TimeZone

  force_ssl
end
