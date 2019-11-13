require 'spec_helper'

RSpec.describe Pacman::Grid do
  subject { Pacman::Grid.new(5, 5) }

  context 'valid_positioning?' do
    it { should be_valid_positioning(0, 0) }
    it { should be_valid_positioning(4, 4) }
    it { should_not be_valid_positioning(5, 5) }
    it { should_not be_valid_positioning(-1, -1) }
  end
end