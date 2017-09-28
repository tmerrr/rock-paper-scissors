class GameItem
	def initialize(name, beats)
		@name = name
		@beats = beats
	end

	def name
		@name
	end

	def beats(game_item)
		@beats == game_item.name
	end
end

class RockPaperScissors
	def initialize
		rock = GameItem.new('rock', 'scissors')
		paper = GameItem.new('paper', 'rock')
		scissors = GameItem.new('scissors', 'paper')
		@options = [rock, paper, scissors]
		puts "Please enter your name."
		get_name
	end

	def get_name
		@name = gets.chomp.strip
		puts
		if @name == ''
			puts "Please enter a valid name"
			get_name
		else
			puts "Hi #{@name}. Ready to play?!"
			get_option
		end
	end

	def get_option
		puts "Please enter your choice [Rock / Paper / Scissors]"
		choice = gets.chomp.strip.downcase
		puts
		option = (@options.select { |i| i.name == choice }).pop
		unless option == nil
			get_results(option)
		else
			puts "#{choice} is not a valid option.  Please try again [Rock / Paper / Scissors]"
			get_option
		end
	end

	def get_results(choice)
		sleep(0.5); puts "1..."
		sleep(0.5); puts "2..."
		sleep(0.5); puts "3..."
		sleep(0.5); puts "Go!"
		sleep(0.5); puts
		ai_choice = @options.sample
		puts "You've chosen to play #{choice.name.capitalize} and the AI has played #{ai_choice.name.capitalize}."
		if choice == ai_choice
			puts "The result is a draw..."
		else
			puts choice.beats(ai_choice) ? "Well done #{@name}, you win!" : "Unlucky #{@name}, you lost..."
		end
	end
end

RockPaperScissors.new