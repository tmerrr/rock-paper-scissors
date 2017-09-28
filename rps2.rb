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

class Game
	def initialize(*options)
		@options = options
	end

	def get_name
		name = gets.chomp.strip
		puts
		if name == ''
			puts "Please enter a valid name"
			get_name
		else
			name
		end
	end

	def get_option
		choice = gets.chomp.strip.downcase
		puts
		option = (@options.select { |i| i.name == choice }).pop
		unless option == nil
			option
		else
			puts "#{choice} is not a valid option.  Please try again [Rock / Paper / Scissors]"
			get_option
		end
	end

	def get_results(choice, name)
		ai_choice = @options.sample
		puts "You've chosen to play #{choice.name.capitalize} and the AI has played #{ai_choice.name.capitalize}."
		if choice == ai_choice
			puts "The result is a draw..."
		else
			puts choice.beats(ai_choice) ? "Well done #{name}, you win!" : "Unlucky #{name}, you lost..."
		end
	end
end

rock = GameItem.new('rock', 'scissors')
paper = GameItem.new('paper', 'rock')
scissors = GameItem.new('scissors', 'paper')
rock_paper_scissors = Game.new(rock, paper, scissors)
puts "Please enter your name."
name = rock_paper_scissors.get_name
puts "Please enter your choice [Rock / Paper / Scissors]"
choice = rock_paper_scissors.get_option
sleep(0.5); puts "1..."
sleep(0.5); puts "2..."
sleep(0.5); puts "3..."
sleep(0.5); puts "Go!"
sleep(0.5); puts
rock_paper_scissors.get_results(choice, name)