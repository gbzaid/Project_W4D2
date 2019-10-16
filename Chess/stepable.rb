module Stepable
    
    def moves
        possible_moves = []

        x, y = self.pos

        move_diffs.each do |direction|
            dx, dy = direction
            
            if self.board[[x + dx,y + dy]].is_a?(NullPiece)
                possible_moves << [dx + x, dy + y]
            elsif self.board[[x + dx,y + dy]].color != self.color
                possible_moves << [dx + x, dy + y]
            end
        end
        
        possible_moves

    end
    
end