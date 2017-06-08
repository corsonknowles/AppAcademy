require_relative 'PolyTreeNode'

class KnightPathFinder
  attr_reader :visited_positions

  def initialize(position)
    @position = position
    @visited_positions = [position]
    # build_move_tree
  end

  def find_path(position)

  end

  def build_move_tree

  end

  def self.valid_moves(position)

  end

  def new_move_positions(position)
    move_set = self.class.valid_moves(position)
    new_moves = move_set - visited_positions
    new_moves +
  end


end
