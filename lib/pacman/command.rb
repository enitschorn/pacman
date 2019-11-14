module Pacman
  class Command
    def process(command)
      case command
      when /\APLACE (?<east>\d),(?<north>\d),(?<direction>\w+)\z/
        [:place, $~[:east].to_i, $~[:north].to_i, $~[:direction]]
      when /\AMOVE\z/
        [:move]
      else
        [:invalid, command]
      end
    end
  end
end
