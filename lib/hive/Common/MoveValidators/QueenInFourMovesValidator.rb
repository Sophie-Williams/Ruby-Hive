require 'MoveValidators/MoveValidator'  
require 'Insects/piece'

class Hive::QueenInFourMovesValidator < Hive::MoveValidator

  def self.validate(board_state, player, move)
    queen =  board_state.get_piece_with_color(move.color, Piece::QUEEN_BEE)
    return false if player.turns(board_state) >= 3 && queen.used? == false &&  move.piece != queen
    return true
  end

end