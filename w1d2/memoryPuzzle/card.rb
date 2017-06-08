class Card
  # CARDS = %w(A K Q J)

  attr_reader :hidden, :solved

  def initialize(set_value = nil)
    @face_value = set_value #||= CARDS.sample
    @hidden = true

  end

  def hide
    @hidden = true
  end

  def reveal
    @hidden = false
  end

  def to_s
    @hidden ? "_" : @face_value
  end

  def solved 
    @face_value = " "
  end

  def ==(card2)
    self.to_s == card2.to_s
  end

end
