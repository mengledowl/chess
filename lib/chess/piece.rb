require_relative './positioner'
require_relative './chess_board'

class Piece
  attr_accessor :position

  def initialize(position)
    @position = position
  end

  def available_moves
    potential_moves
        .select { |move| chess_board.position_exists?(move) }
        .reject { |p| p == position }
        .map(&:join)
  end

  def potential_moves
    raise NotImplementedError
  end

  private

  def positioner
    @positioner ||= Positioner.new(position)
  end

  def chess_board
    @chess_board ||= ChessBoard.new
  end

  def vertical_moves
    chess_board.vertical_row_for(position.first)
  end

  def horizontal_moves
    chess_board.horizontal_row_for(position[1])
  end
end