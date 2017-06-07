class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    place_stones
    @player1 = name1
    @player2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.map!.with_index do |e, i|
      unless [6,13].include?(i)
        [:stone, :stone, :stone, :stone ] #Array.new(4) {:stone}
      else
        []
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless (1..5).cover?(start_pos) || (7..12).cover?(start_pos)
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos].dup
    @cups[start_pos] = []
    # stone_count = stones.count
    # dropped_stones = 0
    # skipped_opponent_cup = 0
    cups_passed = 0
    this_cup = 0
    until stones.empty?
      cups_passed += 1
      this_cup = (cups_passed + start_pos) % 14
      next if current_player_name == @player2 && this_cup == 6
      next if current_player_name == @player2 && this_cup == 13

      @cups[this_cup] ||= []
      @cups[this_cup] << stones.pop
    end


    #   dropped_stones += 1
    #   next if i <= start_pos
    #   next if dropped_stones >= stones
    #   if (i == 13 && current_player_name == @player2) || (i == 6 && current_player_name == @player1)
    #     skipped_opponent_cup += 1
    #     next
    #   end
    #   cup << :stone
    #   dropped_stones += 1
    # end
    render
    last_cup = start_pos + cups_passed
    what_next(last_cup, current_player_name)
  end

  def what_next(last_cup, current_player_name)
    if next_turn(last_cup)
      return :switch
    elsif current_player_name == @player2 && last_cup == 6 || current_player_name == @player1 && last_cup == 13
      return :prompt
    end
    last_cup
  end

  def next_turn(ending_cup_idx)
    @cups[ending_cup_idx].empty?
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
  end

  def winner
    score1 = @cups[6].count
    score2 = @cups[13].count
    return :draw if score2 == score1
    if score1 > score2
      @player1
    else
      @player2
    end
  end
end

class InvalidCupError < StandardError
  def message
    puts 'Nope, not that cup'
  end
end
