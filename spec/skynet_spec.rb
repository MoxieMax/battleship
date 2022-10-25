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
      expect(skynet.sky_board).to be_a(Board)
      expect(skynet.sky_cruiser).to be_a(Ship)
      expect(skynet.sky_submarine).to be_a(Ship)
      expect(skynet.sky_moves).to eq(["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"])
      expect(skynet.sky_ships).to eq([skynet.sky_cruiser, skynet.sky_submarine])
    end
  end
end
