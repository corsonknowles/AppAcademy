class Game
  attr_accessor :fragment, :current_player, :previous_player
  attr_reader :player1, :player2

  def initialize(player1, player2, dictionary)
    @fragment = ''
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @previous_player = player2

    @base_dictionary = Hash.new(false)
    File.readlines(dictionary).each do |word|
      @base_dictionary[word.chomp] = true
    end
    @dictionary = @base_dictionary.dup
  end

  def add_letter(letter)
    @fragment << letter
    frag_length = fragment.length
    @dictionary.reject! do |key, _val|
      key.length < frag_length || key[0...frag_length] != fragment
    end
    puts "dictionary is now #{@dictionary.length} words"
  end

  def round_finished?
    word_complete? || no_word_possible?
  end

  def word_complete?
    @dictionary[fragment]
  end

  def no_word_possible?
    @dictionary.empty?
  end

  def game_over?
    player1.score >= 5 || player2.score >= 5
  end

  def play
    until game_over?
      play_round
      @dictionary = @base_dictionary.dup
      @fragment = ''
    end
    game_conclusion
  end

  def play_round
    play_turn until round_finished?
  end

  def play_turn
    puts current_player.name
    add_letter(current_player.get_letter)
    conclusion if round_finished?
    next_player!
    p fragment
  end

  def next_player!
    @current_player, @previous_player = @previous_player, @current_player
  end

  def game_conclusion
    puts 'GAME OVER'
    puts "#{player1.name}\'s score is #{'GHOST'[0...player1.score]}"
    puts "#{player2.name}\'s score is #{'GHOST'[0...player2.score]}"
  end

  def conclusion
    puts "And the winner is #{previous_player.name}."
    if no_word_possible?
      puts "#{current_player.name} created an impossible word #{fragment}"
    else
      puts "#{current_player.name} completed the word #{fragment}"
    end

    puts 'Current score'
    current_player.add_point
    puts "#{player1.name}\'s score is #{'GHOST'[0...player1.score]}"
    puts "#{player2.name}\'s score is #{'GHOST'[0...player2.score]}"
  end
end

class HumanPlayer
  attr_reader :name
  attr_reader :score

  def initialize(name)
    @name = name
    @score = 0
  end

  def get_letter
    puts 'What would you like to add to the word this round?'
    letter = gets.chomp[0]
    unless valid_letter?(letter)
      puts 'That letter is not valid. Try again.'
      letter = get_letter
    end
    letter.downcase
  end

  def add_point
    @score += 1
  end

  private

  def valid_letter?(letter)
    ('a'..'z').cover?(letter.downcase)
  end
end

class ComputerPlayer

end

if __FILE__ == $PROGRAM_NAME
  player1 = HumanPlayer.new('Adam')
  player2 = HumanPlayer.new('Dave')
  game = Game.new(player1, player2, 'dictionary.txt')
  game.play
end
