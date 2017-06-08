class Towers

# Validate moves so you can only stack on larger towers_of_hanoi
# write a conclusion for the game 

  attr_accessor :stack

  def initialize(size = 3)
    @stack = Array.new(size) {Array.new}
    place_tower
  end

  def place_tower
    how_long = stack.length
    discs = (1..how_long).to_a
    @stack[0] = discs
  end

  def get_move
    motion_array = []
    until motion_array.length >= 2
      puts "Where would you like to move from and to?"
      user_input = gets.chomp
      motion_array = parse(user_input)
    end
    move(motion_array)
  end

  def parse(input)
    # input.chars.map(&to_i)
    result = []
    input.chars.each do |e|
      result << (e.to_i - 1) if (1..stack.size).cover?(e.to_i)
    end
    result
  end

  def move(array)
    unless (0..stack.size).cover?(array[0])
    # unless array[0] < 3
      raise "Starting stack out of bounds"
    end

    unless (0..stack.size).cover?(array[1])
    # unless array[0] < 3
      raise "Ending stack out of bounds"
    end

    from, to = array
    moving_disc = @stack[from].shift
    @stack[to].unshift(moving_disc)
  end

  def won?
    winning_pos = [
      [[], [], [1, 2, 3]],
      [[], [1, 2, 3], []]
    ]
    winning_pos.include?(@stack)

  end

  def to_s
    p @stack
  end

  def play
    until won?
      to_s
      get_move
    end
    to_s
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Towers.new(3)
  game.play
end
