module Pacman
  class Command
    def process(command)
      case command
      when /\APLACE (?<x>\d),(?<y>\d),(?<direction>\w+)\z/
        [:place, $~[:x].to_i, $~[:y].to_i, $~[:direction]]
      when /\AMOVE\z/
        [:move]
      when /\ALEFT\z/
        [:turn_left]
      when /\ARIGHT\z/
        [:turn_right]
      when /\AREPORT\z/
        [:report]
      else
        [:invalid, command]
      end
    end
  end
end
