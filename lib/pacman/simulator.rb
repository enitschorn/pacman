module Pacman
  class Simulator
    attr_reader :pacman

    def initialize(grid)
      @grid = grid
    end
    
    def pacman_placed?
      !pacman.nil?
    end

    def place(east, north, direction)
      return unless @grid.valid_positioning?(east, north)

      @pacman = YellowPacman.new(east, north, direction)
    end

    def move
      return unless pacman_placed?
      return unless @grid.valid_positioning?(*pacman.next_move)

      pacman.move
    end

    def turn_left
      return unless pacman_placed?

      pacman.turn_left
    end

    def turn_right
      return unless pacman_placed?

      pacman.turn_right
    end

    def report
      return unless pacman_placed?

      position = pacman.report
      puts "Pacman is currently at (#{position[:east]}, #{position[:north]}) and facing #{position[:direction]}."
    end

    def invalid(command)
      puts "Sorry, but '#{command.strip}' is an invalid command. Please check the commands file and reenter the correct command."
    end
  end
end
