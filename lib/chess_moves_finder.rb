require 'positioner'

class ChessMovesFinder
  X_AXIS = ('a'..'h').to_a
  Y_AXIS = (1..8).to_a.map(&:to_s)

  attr_accessor :chess_piece, :raw_position

  def initialize(chess_piece, at:)
    @chess_piece = chess_piece
    @raw_position = at
  end

  def retrieve_available_moves
    moves = []

    if chess_piece == 'knight'
      potential_moves = [
          positioner.move(up: 2, right: 1),
          positioner.move(right: 2, down: 1),
          positioner.move(down: 2, left: 1),
          positioner.move(left: 2, up: 1),
          positioner.move(up: 1, right: 2),
          positioner.move(right: 1, down: 2),
          positioner.move(down: 1, left: 2),
          positioner.move(left: 1, up: 2)
      ]

      return potential_moves.select { |move| chess_board.include?(move) }.map(&:join)
    end

    # get vertical row
    vertical_row = Y_AXIS.map { |y| [position.first, y] }
    moves.concat(vertical_row.reject { |p| p == position })

    # get horizontal row
    horizontal_row = X_AXIS.map { |x| [x, position[1]] }
    moves.concat(horizontal_row.reject { |p| p == position })

    if chess_piece == 'queen'
      potential_move = positioner.move(up: 1, left: 1)
      while chess_board.include?(potential_move)
        moves << potential_move
        potential_move = Positioner.new(potential_move).move(up: 1, left: 1)
      end

      potential_move = positioner.move(down: 1, left: 1)
      while chess_board.include?(potential_move)
        moves << potential_move
        potential_move = Positioner.new(potential_move).move(down: 1, left: 1)
      end

      potential_move = positioner.move(up: 1, right: 1)
      while chess_board.include?(potential_move)
        moves << potential_move
        potential_move = Positioner.new(potential_move).move(up: 1, right: 1)
      end

      potential_move = positioner.move(down: 1, right: 1)
      while chess_board.include?(potential_move)
        moves << potential_move
        potential_move = Positioner.new(potential_move).move(down: 1, right: 1)
      end
    end

    moves.map(&:join)
  end

  def position
    chess_board.include?(raw_position.chars) ? raw_position.chars : nil
  end

  def positioner
    @positioner ||= Positioner.new(position)
  end

  private

  def chess_board
    return @board if @board

    @board = []
    X_AXIS.each { |x| Y_AXIS.each { |y| @board << [x, y] } }
    @board
  end
end