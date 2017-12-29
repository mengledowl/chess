require 'positioner'
require 'chess_board'

class Piece
  attr_accessor :position

  def initialize(position)
    @position = position
  end

  def available_moves
    potential_moves.select { |move| chess_board_grid.include?(move) }.map(&:join)
  end

  def potential_moves
    raise NotImplementedError
  end

  private

  def positioner
    @positioner ||= Positioner.new(position)
  end

  def chess_board_grid
    @chess_board_grid ||= chess_board.grid
  end

  def chess_board
    @chess_board ||= ChessBoard.new
  end
end