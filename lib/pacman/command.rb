module Pacman
  class Command
    def process(command)
      if match = /\APLACE (?<east>\d),(?<north>\d),(?<direction>\w+)\z/.match(command)
        [:place, match[:east].to_i, match[:north].to_i, match[:direction]]
      else
        [:invalid, command]
      end
    end
  end
end
