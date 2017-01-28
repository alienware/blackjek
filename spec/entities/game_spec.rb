require 'spec_helper'
require 'blackjek/entities/game.rb'
require 'blackjek/entities/deck.rb'

describe Game do
  it 'has deck cards' do
    cards = [Card.new('A', 'S')]
    decks = []
    4.times do
      decks << Deck.new(cards)
    end
    game = Game.new(decks)

    expect(game).to respond_to(:deck_cards)
    expect(game.deck_cards).to eq(cards * 4)
  end

  it 'has a player' do
    cards = [Card.new('A', 'S')]
    decks = []
    4.times do
      decks << Deck.new(cards)
    end
    game = Game.new(decks)

    expect(game).to respond_to(:player)
  end

  it 'has a dealer' do
    cards = [Card.new('A', 'S')]
    decks = []
    4.times do
      decks << Deck.new(cards)
    end
    game = Game.new(decks)

    expect(game).to respond_to(:dealer)
  end
end
