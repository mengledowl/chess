class Positioner
  attr_accessor :starting_position

  def initialize(starting_position)
    @starting_position = starting_position
  end

  def move(**kwargs)
    position = starting_position
    kwargs.each_pair do |direction, spaces|
      position = Movement.public_send(direction.to_sym, position, spaces: spaces)
    end

    position
  end

  class Movement
    class << self
      def up(position, spaces: spaces)
        [position.first, (position[1].to_i + spaces).to_s]
      end

      def down(position, spaces: 1)
        [position.first, (position[1].to_i - spaces).to_s]
      end

      def left(position, spaces: 1)
        [(position.first.ord - spaces).chr, position[1]]
      end

      def right(position, spaces: 1)
        [(position.first.ord + spaces).chr, position[1]]
      end
    end
  end
end