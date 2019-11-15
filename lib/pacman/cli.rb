module Pacman
  class CLI
    def load_commands(commands_file)
      File.readlines(commands_file).map do |command|
        Pacman::Command.new.process(command)
      end
    end
  end
end
