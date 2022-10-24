class Player
  attr_reader :board,
              :cruiser,
              :submarine,
              :ships

  def initialize
    @board = Board.new
    @cruiser = Ship.new('cruiser', 3)
    @submarine = Ship.new('submarine', 2)
    @ships = [@cruiser, @submarine]
  end

  def player_place_ships
    puts "please pick coordinates to place your ships"
    puts "please pick 3 coordinates for your cruiser"
    @board.render
    cruiser_input = gets.chomp.upcase
    @board.place(@cruiser, cruiser_input)
    puts "please pick 2 coordinates for your submarine"
  end


end
