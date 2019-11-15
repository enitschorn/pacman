module Pacman
  class CLI
    attr_reader :simulator

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
