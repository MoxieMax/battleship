require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  let (:board) {Board.new}
  let (:cruiser) {Ship.new('Cruiser', 3)}
  let (:submarine) {Ship.new('Submarine', 2)}


  describe 'iteration 2' do
    it 'exists' do
      expect(board).to be_a(Board)
    end

    it 'contains cells' do
      expect(board.cells['A1']).to be_a(Cell)
    end

    it 'can validate coordinates' do
      expect(board.valid_coordinate?('A1')).to eq(true)
      expect(board.valid_coordinate?('D4')).to eq(true)
      expect(board.valid_coordinate?('A5')).to eq(false)
      expect(board.valid_coordinate?('E1')).to eq(false)
      expect(board.valid_coordinate?('A22')).to eq(false)
    end
    
    it 'can validate ship placement length' do
      expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
    end
    
    xit 'can validate ship coordinates are consecutive' do
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
    end
    
    xit 'can verify that coordinates are not diagonal' do
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
    end
    
    xit 'can validate ship placement' do
    end
  end
  #expect().to eq()
  
  
  
  
end
