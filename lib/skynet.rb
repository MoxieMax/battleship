class Skynet
attr_reader :sky_board,
            :sky_cruiser,
            :sky_submarine,
            :sky_moves,
            :sky_ships
  def initialize
    @sky_board = Board.new
    @sky_cruiser = Ship.new('cruiser', 3)
    @sky_submarine = Ship.new('submarine', 2)
    @sky_ships = [@sky_cruiser, @sky_submarine]
    @sky_moves = @sky_board.cells.keys
  end

  # def place_ship
  #   first_cell = skynet_moves.sample
  #   require "pry"
  #   binding.pry
  #   skynet_moves.find_all
  # end

  def cruiser_place_hash
    skynet_placements = {
      1 => ["A1", "A2", "A3"],
      2 => ["A2", "A3", "A4"],
      3 => ["B1", "B2", "B3"],
      4 => ["B2", "B3", "B4"],
      5 => ["C1", "C2", "C3"],
      6 => ["C2", "C3", "C4"],
      7 => ["D1", "D2", "D3"],
      8 => ["D2", "D3", "D4"],
      9 => ["A1", "B1", "C1"],
      10 => ["B1", "C1", "D1"],
      11 => ["A2", "B2", "C2"],
      12 => ["B2", "C2", "D2"],
      13 => ["A3", "B3", "C3"],
      14 => ["B3", "C3", "D3"],
      15 => ["A4", "B4", "C4"],
      16 => ["B4", "C4", "D4"]
    }
  end

  def submarine_place_hash
    skynet_placements = {

      1 =>["A1", "A2"],
      2 =>["A2", "A3"],
      3 =>["A3", "A4"],
      4 =>["B1", "B2"],
      5 =>["B2", "B3"],
      6 =>["B3", "B4"],
      7 =>["C1", "C2"],
      8 =>["C2", "C3"],
      9 =>["C3", "C4"],
      10 =>["D1", "D2"],
      11 =>["D2", "D3"],
      12 =>["D3", "D4"],
      13 =>["A1", "B1"],
      14 =>["B1", "C1"],
      15 =>["C1", "D1"],
      16 =>["A2", "B2"],
      17 =>["B2", "C2"],
      18 =>["C2", "D2"],
      19 =>["A3", "B3"],
      20 =>["B3", "C3"],
      21 =>["C3", "D3"],
      22 =>["A4", "B4"],
      23 =>["B4", "C4"],
      24 =>["C4", "D4"]
    }
  end
  
  def skynet_ship_place
  end


end
