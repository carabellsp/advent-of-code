SECONDS_IN_A_YEAR = (365 * 24 * 60 * 60)
SECONDS_IN_A_DAY = (24 * 60 * 60)
SECONDS_IN_AN_HOUR = (60 * 60)
SECONDS_IN_A_MINUTE = 60

def format_duration(seconds)
  return 'now' if seconds.zero?

  years, remainder = seconds.divmod(SECONDS_IN_A_YEAR)
  days, remainder = remainder.divmod(SECONDS_IN_A_DAY)
  hours, remainder = remainder.divmod(SECONDS_IN_AN_HOUR)
  minutes, seconds = remainder.divmod(SECONDS_IN_A_MINUTE)

  years_label = unit_of_time_label(years, 'year')
  days_label = unit_of_time_label(days, 'day')
  hours_label = unit_of_time_label(hours, 'hour')
  minutes_label = unit_of_time_label(minutes, 'minute')
  seconds_label = unit_of_time_label(seconds, 'second')

  [years_label, days_label, hours_label, minutes_label, seconds_label].compact
end

def stringify_array(array)
  last_value = array.pop

  if array.length >= 1
    array.join(', ') + " and #{last_value}"
  else
    last_value
  end
end

def unit_of_time_label(number, unit_of_time)
  return if number.zero?

  "#{number} #{unit_of_time}#{'s' if number > 1}"
end

puts stringify_array(format_duration(62))

# ALTERNATIVE SOLUTION
# def format_duration(seconds)
#   return 'now' if seconds.zero?
#
#   seconds_per_unit = { year: 31_536_000, day: 86_400, hour: 3_600, minute: 60, second: 1 }
#   remaining_seconds = seconds
#
#   # unit - key, seconds - value, counts - hash object
#   counts = seconds_per_unit.each_with_object({}) do |(unit, seconds), counts|
#     remaining_seconds -= (count = remaining_seconds / seconds) * seconds
#     counts[unit] = count unless count.zero?
#   end
#
#   counts.each_with_index.reduce('') do |string, ((unit, count), index)|
#     string << (index == counts.length - 1 ? ' and ' : ', ') unless index.zero?
#     string <<"#{count} #{unit}#{ 's' if count > 1 }"
#   end
# end
