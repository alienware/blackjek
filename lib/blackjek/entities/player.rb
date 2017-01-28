require 'blackjek/entities/blackjeker.rb'

class Player < Blackjeker

  def choose
    puts "Press \n"
    puts "1 to HIT \n"
    puts "2 to STAND \n"
    puts "0 to SUICIDE \n"
    puts "Watcha wanna do? \n"

    choice = gets.to_i
    case choice
    when 0
      exit
    when 1
      return 'HIT'
    when 2
      return 'STAND'
    else
      puts "WHY U NO SERIOUS?! :| \n"
      choose
    end
  end
end