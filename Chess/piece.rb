
class Piece
    attr_accessor :pos
    attr_reader :board, :color

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
    end

    def empty?
        # check if its nullpiece
    end

    def valid_moves
    end

    def symbol
    end 

    private 

    def move_into_check?(end_pos)
        
    end

    
end