require 'spec_helper'

RSpec.describe Pacman::YellowPacman do
  subject { Pacman::YellowPacman.new(0) }

  context 'move' do
    it 'moves 3 spaces' do
      3.times subject.move
      expect(subject.position).to eq(3)
    end
  end
end