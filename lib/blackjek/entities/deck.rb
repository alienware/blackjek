require 'blackjek/entities/card.rb'

class Deck
  attr_accessor :cards

  # TODO: Keyword args
  def initialize cards
    @cards = cards
  end
end
