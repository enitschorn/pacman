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

  context 'MOVE' do
    it 'processes a MOVE command' do
      command, *args = subject.process('MOVE')
      expect(command).to eq(:move)
      expect(args).to be_empty
    end
  end

  context 'LEFT' do
    it 'processes a LEFT command' do
      command, *args = subject.process('LEFT')
      expect(command).to eq(:turn_left)
      expect(args).to be_empty
    end
  end

  context 'RIGHT' do
    it 'processes a RIGHT command' do
      command, *args = subject.process('RIGHT')
      expect(command).to eq(:turn_right)
      expect(args).to be_empty
    end
  end
end