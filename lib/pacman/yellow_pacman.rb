module Pacman
  class YellowPacman
    attr_reader :east, :north

    def initialize(east = 0, north = 0, direction = 'NORTH')
      @east      = east
      @north     = north
      @direction = direction
    end

    def move_east
      @east += 1
    end

    def move_west
      @east -= 1
    end

    def move_north
      @north += 1
    end

    def move_south
      @north -= 1
    end

    def move
      move_north
    end
  end
end
