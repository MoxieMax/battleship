require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/skynet'


RSpec.describe Skynet do
  let (:skynet) {Skynet.new}

  describe "iteration 3" do
    it "exists" do
      expect(skynet).to be_a(Skynet)
    end

    it "has readable attributes" do
      expect(skynet.board).to be_a(Board)
      expect(skynet.cruiser).to be_a(Ship)
      expect(skynet.submarine).to be_a(Ship)
      expect(skynet.skynet).to eq(false)
      expect(skynet.skynet_moves).to eq(["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"])
      expect(skynet.ships).to eq([skynet.cruiser, skynet.submarine])
    end


    it "" do
      expect(skynet.place_ship).to eq("string")
   end

  end
end
