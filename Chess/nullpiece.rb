require 'singleton'

class NullPiece < Piece
    include Singleton
    def initialize
        @symbol = ""
        @color = ""
    end

    def moves
    end

    def symbol
    end
    
end 