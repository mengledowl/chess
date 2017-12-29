require_relative '../piece'

class Queen < Piece
  def potential_moves
    moves = []
    # get vertical row
    vertical_row = chess_board.vertical_row_for(position.first)
    moves.concat(vertical_row.reject { |p| p == position })

    # get horizontal row
    horizontal_row = chess_board.horizontal_row_for(position[1])
    moves.concat(horizontal_row.reject { |p| p == position })

    potential_move = positioner.move(up: 1, left: 1)
    while chess_board_grid.include?(potential_move)
      moves << potential_move
      potential_move = Positioner.new(potential_move).move(up: 1, left: 1)
    end

    potential_move = positioner.move(down: 1, left: 1)
    while chess_board_grid.include?(potential_move)
      moves << potential_move
      potential_move = Positioner.new(potential_move).move(down: 1, left: 1)
    end

    potential_move = positioner.move(up: 1, right: 1)
    while chess_board_grid.include?(potential_move)
      moves << potential_move
      potential_move = Positioner.new(potential_move).move(up: 1, right: 1)
    end

    potential_move = positioner.move(down: 1, right: 1)
    while chess_board_grid.include?(potential_move)
      moves << potential_move
      potential_move = Positioner.new(potential_move).move(down: 1, right: 1)
    end

    moves
  end
end