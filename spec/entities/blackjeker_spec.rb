require 'spec_helper'
require 'blackjek/entities/blackjeker.rb'
require 'blackjek/entities/card.rb'

describe Blackjeker do
  it 'has cards' do
    blackjeker = Blackjeker.new

    expect(blackjeker).to respond_to(:cards)
    expect(blackjeker.cards).to eq([])
  end

  it 'can be busted' do
    blackjeker = Blackjeker.new

    expect(blackjeker).to respond_to(:busted)
    expect(blackjeker.busted).to eq(false)
  end

  it 'can hold tricky aces' do
    blackjeker = Blackjeker.new

    expect(blackjeker).to respond_to(:aces_count)
    expect(blackjeker.aces_count).to eq(0)
  end

  it 'has a score via cards' do
    blackjeker = Blackjeker.new
    blackjeker.cards << Card.new('A', 'H')
    blackjeker.cards << Card.new('A', 'S')
    blackjeker.aces_count = 2

    expect(blackjeker).to respond_to(:score)
    expect(blackjeker.score).to eq(12)
  end
end
