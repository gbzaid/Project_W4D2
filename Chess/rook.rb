require_relative "piece"
require_relative "slideable"

class Rook < Piece
    include Slideable

    def symbol
        :ROOK
    end 

    protected
    def move_dirs
        self.horizontal_dirs
    end 


end