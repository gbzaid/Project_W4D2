require_relative "piece.rb"
require_relative "bishop.rb"
require_relative "rook.rb"
require_relative "nullpiece"
require_relative "king.rb"
require "byebug"

class Board
    attr_accessor :board
    def initialize
        @board = Array.new(8) {Array.new(8, NullPiece.instance)}
        self.board.each_with_index do |row, i|
            if i == 0 || i == 1 || i == 6 || i == 7
                self.board[i].each_with_index do |square, j|
                    self.board[i][j] = Piece.new("white", self, [i,j])
                end
            end 
        end 
    end

    def move_piece(start_pos, end_pos)
        # raise exception if:
        # 1)there is no piece at start_pos or
        # 2)the piece cannot move to end_pos.
        #debugger
        if self[start_pos].nil?
            raise BadPosition.new("This spot is empty.")        
        elsif !self[end_pos].nil?
            raise BadPosition.new("This spot is occupied.")
        else
            self[end_pos] = self[start_pos]
            self[start_pos] = NullPiece.instance
            
        end 
        
    end

    def [](pos)
        row,col = pos
        self.board[row][col]
    end

    def []=(pos, piece)
        row,col = pos
        self.board[row][col] = piece   
    end

    class BadPosition < StandardError
    end 
end


if $PROGRAM_NAME == __FILE__
    game = Board.new
    game[[3,2]] = King.new("white", game, [3,2])
    p game[[3,2]].moves
end