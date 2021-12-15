# frozen_string_literal: true

def file
  File.open('inputs/day5.txt')
end

def regex_of_input
  /(\d+),(\d+) -> (\d+),(\d+)/
end

def create_grid
  '0' * 1_000_000
end

def mark_grid(grid)
  file.each do |line|
    line.match regex_of_input
    # extracts matching data ()i.e. numbers as strings) into MatchData object
    x1,y1,x2,y2 = [$1, $2, $3, $4].map(&:to_i)
    # can access match data values using $ sign, we extract the 4 numbers and save as our x1 etc values
    next unless x1 == x2 || y1 == y2
    # if x1 = x2 it's a horizontal line, y1 = y2 vertical
    x_range = [*Range.new(*[x1, x2].sort)]
    y_range = [*Range.new(*[y1, y2].sort)]
    coordinates = x_range.product(y_range)
    # multiply x range by y range to get an array of arrays - each sub array is the coordinates
    coordinates.each do |x, y|
      index = 1000 * x + y # think of a grid of 5 x 5 and work out the index of the top right to understand this calc
      grid[index] = grid[index].succ unless grid[index] == '2' # unless the coordinate is already marked as a 2, add 1 when we hit that coordinate (2 is an intersecting line)
    end
  end

  calculate_intersections(grid)

  file.close
end

def calculate_intersections(grid)
  p grid.each_char.count { |x| x == "2" } # return the amount of 2s i.e. intersections
end

mark_grid(create_grid)
