module Pacman
  class Command
    def process(command)
      command =~ /\APLACE (?<east>\d),(?<north>\d),(?<direction>\w+)\z/
      [:place, $1.to_i, $2.to_i, $3]
    end
  end
end