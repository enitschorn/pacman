module Pacman
  class Grid
    def initialize(width, length)
      @width  = width
      @length = length
    end

    def valid_positioning?(east, north)
      (0...@width).cover?(east)
      (0...@length).cover?(north)
    end
  end
end