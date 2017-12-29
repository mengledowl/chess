require_relative '../piece'

class Queen < Piece
  def potential_moves
    moves = []

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

    moves.concat(horizontal_moves).concat(vertical_moves)
  end
end