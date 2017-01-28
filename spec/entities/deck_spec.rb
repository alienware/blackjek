require 'spec_helper'
require 'blackjek/entities/deck.rb'
require 'blackjek/entities/card.rb'

describe Deck do
  it 'has cards' do
    cards = [Card.new('A', 'S')]
    deck = Deck.new(cards)

    expect(deck).to respond_to(:cards)
    expect(deck.cards).to eq(cards)
  end
end
