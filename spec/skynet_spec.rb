require 'spec_helper'


RSpec.describe Skynet do
  let (:skynet) {Skynet.new}

  describe "iteration 3" do
    it "exists" do
      expect(skynet).to be_a(Skynet)
    end

    it "has readable attributes" do
      expect(skynet.sky_board).to be_a(Board)
      expect(skynet.sky_cruiser).to be_a(Ship)
      expect(skynet.sky_submarine).to be_a(Ship)
      expect(skynet.sky_moves).to eq(["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"])
      expect(skynet.sky_ships).to eq([skynet.sky_cruiser, skynet.sky_submarine])
    end
    
    it 'can determine if skynet has lost' do
      skynet.sky_cruiser.hit
      skynet.sky_cruiser.hit
      skynet.sky_cruiser.hit
      skynet.sky_submarine.hit
      
      expect(skynet.sky_cruiser.sunk?).to eq(true)
      expect(skynet.sky_submarine.sunk?).to eq(false)
      expect(skynet.has_lost?).to eq(false)
      
      skynet.sky_submarine.hit
      
      expect(skynet.sky_submarine.sunk?).to eq(true)
      expect(skynet.has_lost?).to eq(true)
    end
  end
end
