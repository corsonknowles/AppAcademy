require_relative "tile.rb"

class Board

  attr_reader :grid

  def initialize(grid)
    @grid = grid

  end

  def self.from_file(file_name)
    arr = File.readlines(file_name)
    arr.map!(&:chomp)
    Board.new(arr)

  end

  def render
    grid.each { |e| puts "#{e}" }
  end

  def solved?

  end

  def all_rows
    how_long = grid.length
    lines = []
    how_long.times.each do |i|
      line = []
      how_long.times.each do |j|
        line << grid[i][j]
      end
      lines << line
    end
    lines 
  end

  def all_columns?

  end

  def row_complete?(index)
    grid[index].chars.all? { |entry| "123456789".include?(entry) } && \
    grid[index].chars.uniq == grid[index].chars
  end

  def column_complete?(index)
    result = []
    grid.each do |line|
      result << line[index]
    end
    result


  end




end


if __FILE__ == $PROGRAM_NAME
  board = Board.from_file("sudoku1-solved.txt")
  p board.row_complete?(1)

end
