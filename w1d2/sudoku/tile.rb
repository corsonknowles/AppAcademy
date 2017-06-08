require_relative "board.rb"

class Tile

  def intitalize(given_value = nil)
    @value = nil
    @value ||= given_value
    @given = false
    @given ||= true if given_value
  end



end
