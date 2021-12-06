# frozen_string_literal: true

def read_input
  file = File.open('inputs/day4.txt')
  input = file.each_line.map(&:strip).reject(&:empty?)
  cards = input[1..-1].map { |a| a.split(/\s+/).map(&:to_i) }.each_slice(5).flat_map { |a| [a, a.transpose] }
  numbers = input.first.split(',').map(&:to_i)
end

def determine_winner(numbers, cards)
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
