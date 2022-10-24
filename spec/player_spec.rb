require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'


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
      expect(player.skynet).to eq(false)
      expect(player.skynet_moves).to eq(["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"])
      expect(player.ships).to eq([player.cruiser, player.submarine])
    end


    #it "" do
  #  end

  end
end
