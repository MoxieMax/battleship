require 'spec_helper'

RSpec.describe Cell do
  let (:cell_1) {Cell.new("B4")}
  let (:cell_2) {Cell.new("C3")}
  let (:cruiser) {Ship.new('Cruiser', 3)}
  
  describe 'iteration 1' do
    it 'exists' do
      expect(cell_1).to be_a(Cell)
    end
    
    it 'has readable attributes' do
      expect(cell_1.coordinate).to eq('B4')
    end
    
    it 'starts with no ships' do
      expect(cell_1.ship).to eq(nil)
      expect(cell_1.empty?).to eq(true)
    end
    
    it 'can have ship placed on it' do
      cell_1.place_ship(cruiser)
      expect(cell_1.ship).to eq(cruiser)
      expect(cell_1.empty?).to eq(false)
    end
    
    it 'initializes without having been fired upon' do
      cell_1.place_ship(cruiser)
      expect(cell_1.ship).to eq(cruiser)
      expect(cell_1.fired_upon?).to eq(false)
    end
    
    it 'recognizes when a cell has been fired upon' do
      cell_1.place_ship(cruiser)
      expect(cell_1.ship).to eq(cruiser)
      cell_1.fire_upon
      expect(cell_1.ship.health).to eq(2)
      expect(cell_1.fired_upon?).to eq(true)
    end
    
    it 'will render a cell when prompted' do
      cell_2.place_ship(cruiser)
      expect(cell_2.render).to eq(".")
      expect(cell_2.render(true)).to eq("S")
    end
    
    it 'will register when a cell has been fired upon' do
      cell_2.place_ship(cruiser)
      cell_2.fire_upon
      expect(cell_2.render).to eq("H")
      expect(cruiser.sunk?).to eq(false)
    end
    
    it 'will register when a ship in a cell has been sunk' do
      cell_2.place_ship(cruiser)
      cell_2.fire_upon
      cruiser.hit
      cruiser.hit
      expect(cruiser.sunk?).to eq(true)
      expect(cell_2.render).to eq("X")
    end
  end
end
