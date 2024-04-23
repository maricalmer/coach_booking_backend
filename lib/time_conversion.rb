module TimeConverter
  def self.set_to_central_gmt(date, time_string, timezone_string)
    time = Time.zone.parse("#{date} #{time_string}")
    case timezone_string
    when "(GMT-06:00) Central Time (US & Canada)"
      time
    when "(GMT-09:00) America/Yakutat"
      time += 3.hours
    else
      time
    end
  end
end
