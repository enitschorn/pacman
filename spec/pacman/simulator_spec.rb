require 'spec_helper'

RSpec.describe Pacman::Simulator do
  let(:grid) { Pacman::Grid.new(5, 5) }
  subject { Pacman::Simulator.new(grid) }

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