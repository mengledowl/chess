require_relative './chess_board'
require_relative 'pieces/knight'
require_relative 'pieces/queen'
require_relative 'pieces/rook'

class ChessMovesFinder
  attr_accessor :chess_piece, :raw_position

  def initialize(chess_piece, at:)
    @chess_piece = get_chess_piece(chess_piece)
    @raw_position = at
  end

  def retrieve_available_moves
    chess_piece.new(position).available_moves
  end

  def position
    chess_board.position_exists?(raw_position.chars) ? raw_position.chars : nil
  end

  private

  def chess_board
    @chess_board ||= ChessBoard.new
  end

  def get_chess_piece(piece)
    Object.const_get(piece.to_s.capitalize)
  end
end