module Pacman
  class YellowPacman
    DIRECTIONS = %w[NORTH EAST SOUTH WEST]
    attr_reader :east, :north, :direction

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
      case @direction
      when 'NORTH'  then move_north
      when 'SOUTH'  then move_south
      when 'EAST'   then move_east
      when 'WEST'   then move_west
      end
    end

    def turn_left
      @direction = case @direction
      when 'NORTH'  then 'WEST'
      when 'SOUTH'  then 'EAST'
      when 'EAST'   then 'NORTH'
      when 'WEST'   then 'SOUTH'
      end
    end

    def turn_right
      @direction = case @direction
      when 'NORTH'  then 'EAST'
      when 'SOUTH'  then 'WEST'
      when 'EAST'   then 'SOUTH'
      when 'WEST'   then 'NORTH'
      end
    end

    def report
      {
        east: east,
        north: north,
        direction: direction
      }
    end

    def next_move
      case @direction
      when 'NORTH'  then [@east, @north + 1]
      when 'SOUTH'  then [@east, @north - 1]
      when 'EAST'   then [@east + 1, @north]
      when 'WEST'   then [@east - 1, @north]
      end
    end
  end
end
