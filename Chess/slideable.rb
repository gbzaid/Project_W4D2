require "byebug"

module Slideable
    attr_reader :horizontal_dirs, :diagonal_dirs
    
    private 

    HORIZONTAL_DIRS = [
        [-1, 0], # moves up
        [0, 1],  # moves right
        [1, 0],  # moves down
        [0, -1]  # moves left
    ] 

    DIAGONAL_DIRS = [
        [-1, 1],
        [1, 1],
        [1, -1],
        [-1, -1]
    ]
    
    public 

    def horizontal_dirs
        HORIZONTAL_DIRS
    end 

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        #calls move_dirs to determine direction it can move to
        #get horizontal_dirs, and diagonal_dirs, check if valid by move_dirs
        #call grow_unblocked_moves_in_dir(dx, dy)
        possible_moves = []

        move_dirs.each do |direction|
             
            dx = direction[0]
            dy = direction[1]
            possible_moves += grow_unblocked_moves_in_dir(dx, dy)
        end
        
        possible_moves

    end

    private  
    
    def move_dirs
        # what would this return?
        # if piece is bishop, then bishop
    end 

    def grow_unblocked_moves_in_dir(dx, dy)
        possible_moves = []
        
        x, y = self.pos

        while true
            x += dx
            y += dy
            
            if !(x.between?(0,7) && y.between?(0,7))
                break
            elsif self.board[[x,y]].is_a?(NullPiece)
                possible_moves << [x,y]
            elsif self.board[[x,y]].color != self.color
                possible_moves << [x,y]
                break
            end
        end

        possible_moves
    end
    
end