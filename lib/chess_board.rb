class ChessBoard
  X_AXIS = ('a'..'h').to_a
  Y_AXIS = (1..8).to_a.map(&:to_s)

  def grid
    return @grid if @grid

    @grid = []
    X_AXIS.each { |x| Y_AXIS.each { |y| @grid << [x, y] } }
    @grid
  end

  def vertical_row_for(x_position)
    Y_AXIS.map { |y| [x_position, y] }
  end

  def horizontal_row_for(y_position)
    X_AXIS.map { |x| [x, y_position] }
  end
end