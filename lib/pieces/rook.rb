require_relative '../piece'

class Rook < Piece
  def potential_moves
    moves = []
    # get vertical row
    vertical_row = chess_board.vertical_row_for(position.first)
    moves.concat(vertical_row.reject { |p| p == position })

    # get horizontal row
    horizontal_row = chess_board.horizontal_row_for(position[1])
    moves.concat(horizontal_row.reject { |p| p == position })

    moves
  end
end