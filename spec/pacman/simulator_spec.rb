require 'spec_helper'

RSpec.describe Pacman::Simulator do
  let(:grid) { Pacman::Grid.new(5, 5) }
  subject { Pacman::Simulator.new(grid) }
  
  context 'before pacman has been placed' do
    it 'places the pacman onto a valid position' do
      expect(Pacman::YellowPacman).to receive(:new)
      .with(0, 0, 'NORTH')
      .and_return(double)
      subject.place(0, 0, 'NORTH')
      expect(subject.pacman).not_to be_nil
    end

    it 'cannot place pacman onto an invalid position' do
      expect(Pacman::YellowPacman).not_to receive(:new)
      subject.place(5, 5, 'NORTH')
      expect(subject.pacman).to be_nil
    end
  end

  context 'when pacman has been placed' do
    let(:pacman) { instance_double(Pacman::YellowPacman) }

    before do
      allow(subject).to receive(:pacman).and_return(pacman)
    end

    it 'tells pacman to move' do
      expect(pacman).to receive(:move)
      subject.move
    end

    it 'tells pacman to turn_left' do
      expect(pacman).to receive(:turn_left)
      subject.turn_left
    end

    it 'tells pacman to turn_right' do
      expect(pacman).to receive(:turn_right)
      subject.turn_right
    end

    it 'tells pacman to report its current position' do
      expect(pacman).to receive(:report)
      subject.report
    end
  end
end