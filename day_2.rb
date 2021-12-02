# frozen_string_literal: true

def read_input
  file = File.open('inputs/day2.txt')
  input = file.readlines.map(&:chomp).map(&:split).map { |command| [command[0], command[1].to_i] }
  file.close
  input
end

def calculate_horizontal_position_and_depth(input)
  depth = 0
  horizontal_position = 0

  input.each do |row|
    direction = row[0]
    distance = row[1]

    case direction
    when 'forward'
      horizontal_position += distance
    when 'down'
      depth += distance
    when 'up'
      depth -= distance
    else
      raise ArgumentError, 'not a valid command!'
    end
  end
  depth * horizontal_position
end

def calculate_position_including_aim(input)
  depth = 0
  horizontal_position = 0
  aim = 0

  input.each do |row|
    direction = row[0]
    distance = row[1]

    case direction
    when 'forward'
      horizontal_position += distance
      depth += (aim * distance)
    when 'down'
      aim += distance
    when 'up'
      aim -= distance
    else
      raise ArgumentError, 'not a valid command!'
    end
  end
  depth * horizontal_position
end

puts "Task 1: Total: #{calculate_horizontal_position_and_depth(read_input)}."

puts "Task 2: Total: #{calculate_position_including_aim(read_input)}."

