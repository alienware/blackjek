require 'blackjek/entities/card.rb'

class Deck
  attr_accessor :cards

  def initialize cards
    @cards = cards
  end
end
