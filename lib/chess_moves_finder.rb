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

    # move up
    potential_move = move_up_from(position)
    while chess_board.include?(potential_move)
      moves << potential_move
      potential_move = move_up_from(potential_move)
    end

    # move down
    potential_move = move_down_from(position)
    while chess_board.include?(potential_move)
      moves << potential_move
      potential_move = move_down_from(potential_move)
    end

    # move left
    potential_move = move_left_from(position)
    while chess_board.include?(potential_move)
      moves << potential_move
      potential_move = move_left_from(potential_move)
    end

    # move right
    potential_move = move_right_from(position)
    while chess_board.include?(potential_move)
      moves << potential_move
      potential_move = move_right_from(potential_move)
    end

    if chess_piece == 'queen'
      # move diagonally up and left
      potential_move = move_up_from(position)
      potential_move = move_left_from(potential_move)
      while chess_board.include?(potential_move)
        moves << potential_move
        potential_move = move_up_from(potential_move)
        potential_move = move_left_from(potential_move)
      end

      # move diagonally down and left
      potential_move = move_down_from(position)
      potential_move = move_left_from(potential_move)
      while chess_board.include?(potential_move)
        moves << potential_move
        potential_move = move_down_from(potential_move)
        potential_move = move_left_from(potential_move)
      end

      # move diagonally up and right
      potential_move = move_up_from(position)
      potential_move = move_right_from(potential_move)
      while chess_board.include?(potential_move)
        moves << potential_move
        potential_move = move_up_from(potential_move)
        potential_move = move_right_from(potential_move)
      end

      # move diagonally down and right
      potential_move = move_down_from(position)
      potential_move = move_right_from(potential_move)
      while chess_board.include?(potential_move)
        moves << potential_move
        potential_move = move_down_from(potential_move)
        potential_move = move_right_from(potential_move)
      end
    end

    moves.map(&:join)
  end

  # maybe pull this into a class called "Positioner"?
  def move_up_from(specified_position)
    [specified_position.first, (specified_position[1].to_i + 1).to_s]
  end

  def move_down_from(specified_position)
    [specified_position.first, (specified_position[1].to_i - 1).to_s]
  end

  def move_left_from(specified_position)
    [(specified_position.first.ord - 1).chr, specified_position[1]]
  end

  def move_right_from(specified_position)
    [(specified_position.first.ord + 1).chr, specified_position[1]]
  end

  def position
    chess_board.include?(raw_position.chars) ? raw_position.chars : nil
  end

  private

  def chess_board
    return @board if @board

    @board = []
    X_AXIS.each { |x| Y_AXIS.each { |y| @board << [x, y] } }
    @board
  end
end