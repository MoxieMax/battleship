require 'spec_helper'


RSpec.describe Player do
  let (:player) {Player.new}

  describe "iteration 3" do
    it "exists" do
      expect(player).to be_a(Player)
    end

    it "has readable attributes" do
      expect(player.board).to be_a(Board)
      expect(player.cruiser).to be_a(Ship)
      expect(player.submarine).to be_a(Ship)
      expect(player.ships).to eq([player.cruiser, player.submarine])
    end
    
    it 'can determine if player has lost' do
      player.cruiser.hit
      player.cruiser.hit
      player.cruiser.hit
      player.submarine.hit
      
      expect(player.cruiser.sunk?).to eq(true)
      expect(player.submarine.sunk?).to eq(false)
      expect(player.has_lost?).to eq(false)
      
      player.submarine.hit
      
      expect(player.submarine.sunk?).to eq(true)
      expect(player.has_lost?).to eq(true)
    end
  end
end
