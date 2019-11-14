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
  end
end
