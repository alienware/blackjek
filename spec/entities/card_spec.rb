require 'spec_helper'
require 'blackjek/entities/card.rb'

describe Card do
  it 'requires face value and suit' do
    expect { Card.new }.to raise_error(ArgumentError)
  end

  context 'invalid' do
    it 'face value' do
      expect { Card.new('Z', 'H') }.to raise_error('Invalid card')
    end

    it 'suit' do
      expect { Card.new('Q', 'Z') }.to raise_error('Invalid suit')
    end
  end

  context 'valid' do
    it 'has a face value' do
      card = Card.new('Q', 'H')

      expect(card).to respond_to(:face_value)
      expect(card.face_value).to eq('Q')
    end

    it 'has a suit' do
      card = Card.new('Q', 'H')

      expect(card).to respond_to(:face_value)
      expect(card.suit).to eq('H')
    end

    it 'has a score' do
      card = Card.new('Q', 'H')

      expect(card).to respond_to(:score)
      expect(card.score).to eq([10])
    end
  end

  context 'ace' do
    it 'has two possible scores' do
      card = Card.new('A', 'H')

      expect(card).to respond_to(:score)
      expect(card.score).to eq([11, 1])
    end
  end
end
