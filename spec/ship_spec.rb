require 'spec_helper'

RSpec.describe Ship do
  before(:all) do
     @cruiser = Ship.new('Cruiser', 3)
  end
   
  it 'exists' do
    expect(@cruiser).to be_a(Ship)
  end

  it 'has readable attributes' do
    expect(@cruiser.name).to eq('Cruiser')
    expect(@cruiser.length).to eq(3)
    expect(@cruiser.health).to eq(3)
  end

  it 'starts not sunk' do
    expect(@cruiser.sunk?).to eq(false)
  end

  it 'can take hits and lose health' do
    @cruiser.hit
    expect(@cruiser.health).to eq(2)
    @cruiser.hit
    expect(@cruiser.health).to eq(1)
    expect(@cruiser.sunk?).to eq(false)
    @cruiser.hit
    expect(@cruiser.sunk?).to eq(true)
  end
end
