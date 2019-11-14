module Pacman
  class Command
    def process(command)
      case command
      when /\APLACE (?<east>\d),(?<north>\d),(?<direction>\w+)\z/
        [:place, $~[:east].to_i, $~[:north].to_i, $~[:direction]]
      when /\AMOVE\z/
        [:move]
      when /\ALEFT\z/
        [:turn_left]
      when /\ARIGHT\z/
        [:turn_right]
      else
        [:invalid, command]
      end
    end
  end
end
