require 'chess_board'

class ChessMovesFinder
  attr_accessor :chess_piece, :raw_position

  def initialize(chess_piece, at:)
    @chess_piece = chess_piece
    @raw_position = at
  end

  def retrieve_available_moves
    chess_piece.new(position).available_moves
  end

  def position
    chess_board.grid.include?(raw_position.chars) ? raw_position.chars : nil
  end

  private

  def chess_board
    @chess_board ||= ChessBoard.new
  end
end