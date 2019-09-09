module TimeZone
  extend ActiveSupport::Concern

  included do
    before_action :set_time_zone
  end

  private

  def set_time_zone
    zone = (cookies[:time_zone].presence || 'UTC').delete('"')

    if zone == 'America/Los_Angeles'
      zone = 'Pacific Time (US & Canada)'
    end

    Time.zone = zone
  end

end
