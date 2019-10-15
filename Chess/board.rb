require_relative "piece.rb"
require "byebug"

class Board
    attr_accessor :board
    def initialize
        @board = Array.new(8) {Array.new(8, nil)}
        self.board.each_with_index do |row, i|
            if i == 0 || i == 1 || i == 6 || i == 7
                #self.board[i] = Array.new(8, Piece.new)
                self.board[i].each_with_index do |square, j|
                    self.board[i][j] = Piece.new
                end
            end
            
        end 
    end

    def move_piece(start_pos, end_pos)
        # raise exception if:
        # 1)there is no piece at start_pos or
        # 2)the piece cannot move to end_pos.
        #debugger
        if self.board[start_pos].nil?
            raise BadPosition.new("This spot is empty.")        
        elsif !self.board[end_pos].nil?
            raise BadPosition.new("This spot is occupied.")
        else
            self.board[end_pos] = self.board[start_pos]
            self.board[start_pos].delete
        end 
        
    end

    def [](pos)
        #debugger
        row,col = pos # pos = [1,0]
        self.board[row][col]
    end

    


    def []=(pos, piece)
        row,col = pos
        self.board[row][col] = piece   
    end

    class BadPosition < StandardError
    end 
end 