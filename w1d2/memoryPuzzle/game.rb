require_relative "board.rb"
require_relative "card.rb"
require "byebug"

class Game

  attr_reader :board, :previous_guess

  def initialize
    @board = Board.new
    @previous_guess = nil
  end

  def play
    board.populate

    until over?
      system("clear")
      # board.render
      previous_guess = make_guess
      board[previous_guess].reveal
      board.render
      current_guess = make_guess
      board[current_guess].reveal
      board.render

      # debugger
      if board[current_guess] == board[previous_guess]
        puts "You got a match!"
        board[current_guess].solved
        board[previous_guess].solved
      else
        board[current_guess].hide
        board[previous_guess].hide
      end

      sleep(2)

    end
  end

  def over?
  end

  def make_guess
    puts "Where would you like to guess?"
    guess = gets.chomp
    parse(guess)
#    guess = [0,0]
  end

  def parse(input)
    result = []
    # only works on digits up to 9
    input.chars.each do |digit|
      result << digit.to_i if (0..9).include?(digit.to_i)
    end
    result
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
