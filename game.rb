require_relative 'player.rb'
require_relative 'question.rb'

class Game
	attr_accessor :game_status
	def initialize()
		@game_status = true
		@player1 = Player.new("Player 1")
		@player2 = Player.new("Player 2")
		@counter = 0
		puts "Game started!"
	end

	def run_game()
		while @game_status
			question = Question.new
			player = get_current_player
			puts "#{player.name}: What does #{question.first_val} + #{question.second_val} equal?"
			answer = gets.chomp
			# puts "#{player.name} responded with #{answer}"
			check_response(answer, question.answer)
		end
	end

	def check_response(response, answer)
		player = get_current_player
		if response.to_i == answer
			puts "#{player.name}: Yes! You are correct."
		else
			puts "#{player.name}: Seriously? No!"
			player.reduceLife
		end
		keep_score
		continue?
	end

	def switch_player()
		@counter += 1
		puts "----- NEW TURN -----"
	end

	def get_current_player()
		if @counter % 2 == 0
			@player1
		else
			@player2
		end
	end

	def keep_score()
		puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
	end

	def who_won()
		if @player1.lives > 0
			@player1
		else
			@player2
		end
	end

	def continue?()
		if @player1.lives == 0 || @player2.lives == 0
			@game_status = false
			winner = who_won
			puts "#{winner.name} wins with a score of #{winner.lives}/3"
			puts "----- GAME OVER -----"
			puts "Good bye!"
		else 
			switch_player
		end
	end
end
