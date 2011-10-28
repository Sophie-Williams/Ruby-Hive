require 'Insects/piece'
class Mosquito < Piece

def initialize() 
end
  
def availableMoves(boardState)
  moves = Array.new()
  moves += availablePlaceMoves( boardState ) unless @used 
  moves += Mosquito.availableBoardMoves(self, boardState)  if @used
 return moves
end
     
def self.availableBoardMoves(mosquito, boardState)  
  moves = Array.new()
  mosquito.forEachNeighbouringPiece(boardState, :exclude => [HexagonSide::ONTOP_SIDE, HexagonSide::BOTTOM_SIDE]) do |piece|
    moves += piece.class.availableBoardMoves(mosquito, boardState) 
  end
 return moves
end
   

   
end