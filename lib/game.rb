require "./board.rb"
require "./player.rb"

class Game
    
    def initialize
        @player = Player.new
        @board = Board.new
    end

    def play
        while @board.attempts_left > 0
            @board.print_board
            guess = @player.get_guess
            @board.enter_guess(guess)
            @board.provide_information
        end
    end

end
