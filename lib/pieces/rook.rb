require_relative '../piece'

class Rook < Piece
  def potential_moves
    vertical_moves.concat(horizontal_moves)
  end
end