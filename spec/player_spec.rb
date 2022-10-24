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
      expect(player.ships).to eq([player.cruiser, player.submarine])
    end


    it "" do
      expect(player.player_place_ships).to eq("")

    end


  end
end
