class Card
  attr_accessor :face_value
  attr_accessor :suit

  def initialize face_value, suit
    raise('Invalid card') unless \
      ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'].include?(face_value)
    @face_value = face_value
    @suit = suit
  end

  def score
    if ['2', '3', '4', '5', '6', '7', '8', '9', '10'].include?(face_value)
      return [face_value.to_i]
    elsif ['J', 'Q', 'K'].include?(face_value)
      return [10]
    elsif face_value == 'A'
      return [11, 1]
    end
  end

  def is_ace?
    face_value.eql?('A')
  end
end
