require 'Insects/piece'
class LadyBug < Piece

def initialize(board_state, id)
  super(board_state, id)  
end
 
def availableMoves
  moves = Array.new()
  moves += availablePlaceMoves unless used?
  moves += LadyBug.availableBoardMoves(self) if used? and movable?
 return moves
end 

def self.availableBoardMoves(ladybug)
  moves = Array.new()
  #ladybug.touch do 
  #  moves
  #end
  return moves
end

def trapped?
  return false
end
  
end