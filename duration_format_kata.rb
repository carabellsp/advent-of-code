def format_duration(seconds)
  return 'now' if seconds.zero?

  years, remainder = seconds.divmod(31536000) # seconds in a year
  days, remainder = remainder.divmod(86400) # seconds in a day
  hours, remainder = remainder.divmod(3600) # seconds in an hour
  minutes, seconds = remainder.divmod(60)

  years_label = unit_of_time_label(years, 'year')
  days_label = unit_of_time_label(days, 'day')
  hours_label = unit_of_time_label(hours, 'hour')
  minutes_label = unit_of_time_label(minutes, 'minute')
  seconds_label = unit_of_time_label(seconds, 'second')

  total_time = [years_label, days_label, hours_label, minutes_label, seconds_label].compact

  last_value = total_time.last

  total_time.join(', ') + " and #{last_value}"
end

def unit_of_time_label(number, unit_of_time)
  return if number.zero?

  "#{number} #{unit_of_time}#{'s' if number > 1}"
end

puts format_duration(364000)
