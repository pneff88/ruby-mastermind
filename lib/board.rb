class Board
    attr_accessor :winning_colors
    attr_accessor :attempts_left
    attr_accessor :near_count
    attr_accessor :exact_count
    attr_accessor :grid

    def initialize
        @grid = Array.new(10) { Array.new(8, '_') }
        @colors = ['Rd','Bl','Grn','Ylw','Prp','Wh','Gry','Br'];
        @winning_colors = [];
        set_winning_colors();
        @attempts_left = 10;
        @exact_count = 0;
        @near_count = 0; 
    end

    def set_winning_colors
        until @winning_colors.length == 4 do 
            color = @colors.sample
            if !@winning_colors.include?(color)
                @winning_colors << color 
            end
        end
    end

    def print_board
        @grid.each do |row|
            puts row.join(' ')
        end
    end

    def current_row
        @grid[(@attempts_left-1)]
    end

    def enter_guess(guess_arr)
        guess_arr.each_with_index do |guess_ele, i|
            current_row[i] = guess_ele
            if guess_ele == winning_colors[i]
                self.exact_count += 1
            elsif guess_ele != winning_colors[i] && winning_colors.include?(guess_ele) 
                self.near_count += 1
            end
        end
    end

    def provide_information #should reset all counters to zero and populate upper four of the array
        i = 4
        while i<8 do
            current_pos = current_row[i]
            if self.exact_count>0
                current_pos = 'X'
                self.exact_count -= 1
            elsif near_count>0
                current_pos =  'N'
                self.near_count -= 1
            else current_pos = '_'
            end
            i+=1
        end
    end
    

end