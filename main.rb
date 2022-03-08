require "./players"
require "./questions"

class Math_game

  attr_accessor :player

  def initialize
    @player = [Player.new(1), Player.new(2)]
  end

  def start
    turn = 1

    while player[0].lives > 0 && player[1].lives > 0 do

      question = Questions.new
      puts "Player #{turn}: #{question.question}"
      print "> "
      answer = $stdin.gets.chomp.to_i

      if answer == question.answer
        puts "Player #{turn}: Yes! You are correct."
        puts "#{player[0].lives}/3 vs #{player[1].lives}/3"

      else 
        puts "Player #{turn}: Incorrect answer."
        @player[turn - 1].lose_life
        puts "#{player[0].lives}/3 vs #{player[1].lives}/3"
      end
      # turn == 1 ? turn = 2 : turn = 1;
      if (turn == 1)
        turn = 2
      else 
        turn = 1
      end
      
      if player[0].is_dead || player[1].is_dead
        puts "Player #{turn} wins with a score of #{player[turn - 1].lives}/3"
        puts "--- GAME OVER ---"
      else 
        puts "--- NEW TURN ---"
      end
    end
  end
end

new_game =  Math_game.new
new_game.start