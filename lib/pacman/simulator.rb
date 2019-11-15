module Pacman
  class Simulator
    attr_reader :pacman

    def initialize(grid)
      @grid = grid
    end

    def place(east, north, direction)
      return unless @grid.valid_positioning?(east, north)

      @pacman = YellowPacman.new(east, north, direction)
    end

    def move
      pacman.move
    end

    def turn_left
      pacman.turn_left
    end

    def turn_right
      pacman.turn_right
    end

    def report
      position = pacman.report
      puts "Pacman is currently at (#{position[:east]}, #{position[:north]}) and facing #{position[:direction]}"
    end
  end
end
