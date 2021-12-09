# frozen_string_literal: true

def read_input
  file = File.open('inputs/day4.txt')
  file.each_line.map(&:strip).reject(&:empty?)
end

def cards
  # we exclude line[0] as it contains the numbers not the cards
  # we then map the numbers into arrays of 5 integers
  # then using each_slice, we group 5 arrays into a larger array - these are our cards
  read_input[1..-1].map { |a| a.split(/\s+/).map(&:to_i) }.each_slice(5).flat_map { |a| [a, a.transpose] }
end

def numbers
  # creates an array of the numbers in the order they will be called
  read_input.first.split(',').map(&:to_i)
end

def bingo_winner(numbers, cards)
  numbers.each_with_index do |n, index|
    selected = numbers[0..index]
    cards.each do |card|
      card.each do |row|
        # we use next in an iterative cycle to move on to the next item if the condition is not met
        # i.e. if we do not have 5 bingo numbers in a row
        next unless (row & selected).length == 5

        # we multiply the most recent number by the remaining card elements sum
        puts n * (card.flatten - selected).sum
        exit
      end
    end
  end
end

puts bingo_winner(numbers, cards)

# [[1,2], [3,4]].transpose => [[1,3], [2,4]]
# binding.irb for non-Rails projects
