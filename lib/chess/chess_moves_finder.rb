require_relative 'chess_board'
require_relative 'pieces/knight'
require_relative 'pieces/queen'
require_relative 'pieces/rook'

class ChessMovesFinder
  attr_accessor :chess_piece, :raw_position

  PIECES = {
      knight: Knight,
      queen:  Queen,
      rook:   Rook
  }

  def initialize(chess_piece, at:)
    @chess_piece = get_chess_piece(chess_piece)
    @raw_position = at
  end

  def retrieve_available_moves
    chess_piece.new(position).available_moves
  end

  def position
    return raw_position.chars if chess_board.position_exists?(raw_position.chars)

    abort("Error: position #{raw_position} is outside of the chess board area")
  end

  private

  def chess_board
    @chess_board ||= ChessBoard.new
  end

  def get_chess_piece(piece)
    PIECES[piece.to_s.downcase.to_sym] || abort("Error: unknown piece: #{piece}. Try one of the following: #{PIECES.keys.join(', ')}")
  end
end