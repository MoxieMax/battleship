require 'pry'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  let (:cell) {Cell.new('B4')}
  let (:cruiser) {Ship.new('Cruiser', 3)}
  
  describe 'iteration 1' do
    it 'exists' do
      expect(cell).to be_a(Cell)
    end
    
    it 'has readable attributes' do
      expect(cell.coordinate).to eq('B4')
    end
    
    it 'starts with no ships' do
      expect(cell.ship).to eq(nil)
      expect(cell.empty?).to eq(true)
    end
    
    it 'can have ship placed on it' do
      cell.place_ship(cruiser)
      expect(cell.ship).to eq(cruiser)
      expect(cell.empty?).to eq(false)
    end
    
    it 'initializes without having been fired upon' do
      cell.place_ship(cruiser)
      expect(cell.ship).to eq(cruiser)
      expect(cell.fired_upon?).to eq(false)
    end
    
    it 'recognizes when a cell has been fired upon' do
      cell.place_ship(cruiser)
      expect(cell.ship).to eq(cruiser)
      cell.fire_upon
      expect(cell.ship.health).to eq(2)
      expect(cell.fired_upon?).to eq(true)
    end
  end
end
