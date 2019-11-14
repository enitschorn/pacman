require 'spec_helper'

RSpec.describe Pacman::Command do
  subject { Pacman::Command.new }
  
  context 'PLACE' do
    it 'processes a PLACE command' do
      command, *args = subject.process('PLACE 2,2,NORTH')
      expect(command).to eq(:place)
      expect(args).to eq([2, 2, 'NORTH'])
    end

    it 'returns invalid for an invalid PLACE command' do
      command = subject.process('PLACE 2, 2, NORTH')
      expect(command).to eq([:invalid, 'PLACE 2, 2, NORTH'])
    end
  end
end