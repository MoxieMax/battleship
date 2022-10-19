require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  let (:board) {Board.new}
  let (:cruiser) {Ship.new("Cruiser", 3)}
  let (:submarine) {Ship.new("Submarine", 2)}


  describe "iteration 2" do
    it "exists" do
      expect(board).to be_a(Board)
    end

    it "contains cells" do
      expect(board.cells["A1"]).to be_a(Cell)
    end

    it "can validate coordinates" do
      expect(board.valid_coordinate?("A1")).to eq(true)
      expect(board.valid_coordinate?("D4")).to eq(true)
      expect(board.valid_coordinate?("A5")).to eq(false)
      expect(board.valid_coordinate?("E1")).to eq(false)
      expect(board.valid_coordinate?("A22")).to eq(false)

    end




  end






















end
