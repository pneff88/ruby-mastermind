class Player 

    def initialize
    end

    def get_guess 
        puts "Player, enter your guess of four colors using the abbreviations:" 
        puts " 'Rd','Bl','Grn','Ylw','Prp','Wh','Gry','Br' "
        puts "Example: Rd Grn Ylw Wh"
        guess = gets.chomp.split(' ')
        guess
    end

end