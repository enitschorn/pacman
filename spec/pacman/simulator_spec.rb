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

    it 'does not have pacman placed by default' do
      expect(subject.pacman_placed?).to eq(false)
    end

    it 'does not move pacman' do
      expect { subject.move }.to_not raise_error
    end

    it 'turning pacman left does not raise an error' do
      expect { subject.turn_left }.to_not raise_error
    end

    it 'turning pacman right does not raise an error' do
      expect { subject.turn_right }.to_not raise_error
    end

    it 'asking pacman to report its position does not raise an error' do
      expect { subject.report }.to_not raise_error
    end

    it 'tells us when a command is invalid' do
      message = "Sorry, but 'PLACE 1, 2, NORTH' is an invalid command. Please check the commands file and reenter the correct command.\n"
      expect { subject.invalid('PLACE 1, 2, NORTH') }.to output(message).to_stdout
    end
  end

  context 'when pacman has been placed' do
    let(:pacman) { instance_double(Pacman::YellowPacman, next_move: [0, 0]) }

    before do
      allow(subject).to receive(:pacman).and_return(pacman)
    end

    it 'has placed pacman' do
      expect(subject.pacman_placed?).to eq(true)
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
      expect(pacman).to receive(:report) { { east: 2, north: 4, direction: 'EAST'} }
      subject.report
    end
  end

  context 'pacman placed at grid boundaries' do
    before do
      subject.place(0, 4, 'NORTH')
    end

    it 'cannot go past the grid\'s boundaries' do
      subject.move
      message = "Pacman is currently at (0, 4) and facing NORTH.\n"
      expect { subject.report }.to output(message).to_stdout
    end 
  end
end