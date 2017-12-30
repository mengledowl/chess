require_relative '../piece'

class Knight < Piece
  def potential_moves
    [
        positioner.move(up: 2, right: 1),
        positioner.move(right: 2, down: 1),
        positioner.move(down: 2, left: 1),
        positioner.move(left: 2, up: 1),
        positioner.move(up: 1, right: 2),
        positioner.move(right: 1, down: 2),
        positioner.move(down: 1, left: 2),
        positioner.move(left: 1, up: 2)
    ]
  end
end