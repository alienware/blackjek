class Blackjeker
  attr_accessor :cards
  attr_accessor :busted
  attr_accessor :aces_count

  def initialize
    @busted = false
    @cards = []
    @aces_count = 0
  end

  # OPTIMIZE: Store score on Blackjeker object
  def score
    score = 0
    cards.each do |card|
      score += card.score.first
      if score > 21 && aces_count > 0
        @aces_count -= 1
        score -= 10
      end
    end

    score
  end

  def busted?
    busted
  end
end