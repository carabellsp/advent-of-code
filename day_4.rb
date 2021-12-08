# frozen_string_literal: true

def read_input
  file = File.open('inputs/day4.txt')
  file.each_line.map(&:strip).reject(&:empty?)
end

def cards
  read_input[1..-1].map { |a| a.split(/\s+/).map(&:to_i) }.each_slice(5).flat_map { |a| [a, a.transpose] }
end

def numbers
  read_input.first.split(',').map(&:to_i)
end

def bingo_winner(numbers, cards)
  numbers.each_with_index do |n, index|
    selected = numbers[0..index]
    cards.each do |card|
      card.each do |row|
        next unless (row & selected).length == 5

        puts n * (card.flatten - selected).sum
        exit
      end
    end
  end
end

puts bingo_winner(numbers, cards)

# [[1,2], [3,4]].transpose => [[1,3], [2,4]]
# binding.irb for non-Rails projects
