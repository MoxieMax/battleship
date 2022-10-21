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
    
    it 'can validate horizontal placement is consecutive' do
      expect(board.horizontal_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)
      
      expect(board.horizontal_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
      
      expect(board.horizontal_placement?(submarine, ["A1", "C1"])).to eq(false)
      expect(board.horizontal_placement?(cruiser, ["A3", "A2", "A1"])).to eq(true) #use .sort! method
      expect(board.horizontal_placement?(submarine, ["C1", "B1"])).to eq(false)
    end
    
    it 'can validate vertical placement is consecutive' do
      expect(board.vertical_placement?(cruiser, ["A1", "B1", "C1"])).to eq(true)
      expect(board.valid_placement?(cruiser, ["A1", "B1", "C1"])).to eq(true)
      
      expect(board.vertical_placement?(cruiser, ["A1", "A2", "A3"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)
      
      expect(board.vertical_placement?(submarine, ["A1", "C1"])).to eq(false)
      expect(board.vertical_placement?(submarine, ["C1", "B1"])).to eq(true)
    end

    it 'can verify that coordinates are not diagonal' do
      expect(board.valid_placement?(submarine, ["A1", "B2"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(true)
    end
    
    it 'can validate ship placement' do
      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]
      board.place(cruiser, ["A1", "A2", "A3"])
      
      expect(cell_1.ship).to eq(cruiser)
      expect(cell_2.ship).to eq(cruiser)
      expect(cell_3.ship).to eq(cruiser)
      expect(cell_3.ship == cell_2.ship).to eq(true)
    end
    
    it 'verifies a cell is empty' do
      board.place(cruiser, ["A1", "A2", "A3"])
      
      expect(board.cell_empty?(["A1", "A2", "A3"])).to eq(false)
      expect(board.cell_empty?(["A4"])).to eq(true)
    end
    
    it 'will not allow ships to overlap' do
      board.place(cruiser, ["A1", "A2", "A3"])
      board.place(submarine, ["A1", "B1"])
    
      expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
    end
  end
  #expect().to eq()
  
  
  
  
end
