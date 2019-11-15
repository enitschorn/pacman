module Pacman
  class CLI
    attr_reader :simulator

    def initialize
      grid =Pacman::Grid.new(5, 5)
      @simulator = Pacman::Simulator.new(grid)
    end

    def load_commands(commands_file)
      File.readlines(commands_file).map do |command|
        Pacman::Command.new.process(command)
      end
    end

    def run(commands)
      commands.each do |command, *args|
        simulator.send(command, *args)
      end
    end
  end
end
