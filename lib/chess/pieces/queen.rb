require_relative '../piece'

class Queen < Piece
  def potential_moves
    moves = [
        recursive_move(positioner, up: 1, left: 1),
        recursive_move(positioner, down: 1, left: 1),
        recursive_move(positioner, up: 1, right: 1),
        recursive_move(positioner, down: 1, right: 1),
        horizontal_moves,
        vertical_moves
    ]

    moves.reduce([], :concat)
  end

  private

  # returns an array of positions going from the position passed in, to the edge of the board in the direction(s) specified
  def recursive_move(movement_positioner, moves: [], **kwargs)
    potential_move = movement_positioner.move(kwargs)

    return moves unless chess_board.position_exists?(potential_move)

    recursive_move(Positioner.new(potential_move), moves: moves.push(potential_move), **kwargs)
  end
end