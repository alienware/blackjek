require 'byebug'
require 'blackjek/version'
require 'blackjek/entities/game.rb'

# TODO: Private methods
module Blackjek
  @suits = ['D', 'C', 'S', 'H']
  @face_values = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
  @cards = []
  @num_desks = 0
  @decks = []
  @player_win_count = 0
  @dealer_win_count = 0
  @draw_count = 0

  @face_values.product(@suits).each do |face_value, suit|
    @cards << Card.new(face_value, suit)
  end

  def self.start
    game = Game.new(@decks)
    game.begin

    winner = game.winner.class.to_s
    case winner
    when 'Player'
      @player_win_count += 1
      puts "The Player won that game."
    when 'Dealer'
      @dealer_win_count += 1
      puts "The Dealer won that game."
    when 'NilClass'
      @draw_count += 1
      puts "The game was a draw."
    else
      raise('Invalid player')
    end

    self.continue
  end

  def self.set_up_decks
    puts "How many decks you gonna play with? (4 or more) \n"

    num_decks = gets.to_i
    unless num_decks >= 4
      puts "WHY U NO SERIOUS?! :| \n"
      set_up_decks
    end

    num_decks.times do
      @decks << Deck.new(@cards)
    end

    @num_decks = @decks.length
  end

  private
    def self.continue
      puts "\n"
      puts "Press \n"
      puts "1 to CONTINUE \n"
      puts "0 to SUICIDE \n"
      puts "Watcha wanna do? \n"

      continue = gets.to_i
      case continue
      when 0
        self.game_statistics
        exit
      when 1
        self.start
      else
        puts "WHY U NO SERIOUS?! :| \n"
        continue
      end
    end

    def self.game_statistics
      puts "Game over. \n\n"
      puts "Game statistics \n"
      puts '*' * 80
      puts "Player wins: #{@player_win_count} \n"
      puts "Dealer wins: #{@dealer_win_count} \n"
      puts "Draw games: #{@draw_count} \n"
      puts '*' * 80
      puts "\n"
    end
end
