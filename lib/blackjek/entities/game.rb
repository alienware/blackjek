require 'blackjek/entities/deck.rb'
require 'blackjek/entities/dealer.rb'
require 'blackjek/entities/player.rb'

class Game
  attr_accessor :deck_cards
  attr_accessor :dealer
  attr_accessor :player
  attr_accessor :player_in
  attr_accessor :winner

  def initialize decks
    shuffle_decks(decks)
    set_up_dealer
    set_up_player
    self.winner = nil
  end

  def begin
    sleep(0.4)
    puts "Time to deeeeeeeeeeal ... \n"

    deal_first

    print_cards

    while player_in && !player.busted?
      player_choice = player.choose
      case player_choice
      when 'HIT'
        puts '*' * 80
        puts "The player choses to hit. \n"
        deal(player)
        print_cards

        player_score = player.score
        if player_score > 21
          player.busted = true
        elsif player_score == 21
          @player_in = false
        end
      when 'STAND'
        puts '*' * 80
        puts "The player choses to stand. \n"
        @player_in = false
      end
    end

    if player.busted?
      puts "The player is busted. \n"
      @winner = dealer
    else
      while !dealer.busted?
        if dealer.score > 17
          dealer.busted = true
        else
          puts "Hitting the dealer. \n"
          deal(dealer)
          print_cards
        end
      end
    end

    unless winner
      player_score = player.score
      dealer_score = dealer.score

      if player_score == dealer_score
        @winner = nil
      elsif dealer_score > 21
        @winner = player
      elsif player_score > dealer_score
        @winner = player
      else
        @winner = dealer
      end
    end

    print_cards
  end

  private
    def set_up_dealer
      @dealer = Dealer.new
    end

    def set_up_player
      @player_in = true
      @player = Player.new
    end

    def shuffle_decks decks
      puts "Shuffling up #{decks.length} decks ... \n"
      @deck_cards = decks.map { |deck| deck.cards }.flatten!
      @deck_cards.shuffle!
    end


    def deal_first
      2.times do
        deal(player)
        deal(dealer)
      end
    end

    def deal blackjeker
      dealt_card = deck_cards.shift
      blackjeker.cards << dealt_card
      blackjeker.aces_count += 1 if dealt_card.is_ace?
      sleep(0.1)
    end

    def print_cards
      puts '*' * 80
      puts "Player cards: \n"
      player.cards.each do |card|
        puts "#{card.face_value} of #{card.suit}"
      end
      puts "Player score: #{player.score} \n"
      puts "Player hit BLACKJACK" if player.score == 21

      puts '*' * 80
      puts "Dealer cards: \n"
      if player_in && !player.busted?
        dealer_visible_card = dealer.cards.first
        puts "#{dealer_visible_card.face_value} of #{dealer_visible_card.suit}"
        puts "X \n"
        puts "Dealer score: Unknown"
      else
        dealer.cards.each do |card|
          puts "#{card.face_value} of #{card.suit}"
        end
        puts "Dealer score: #{dealer.score} \n"
      end
      puts '*' * 80
    end
end
