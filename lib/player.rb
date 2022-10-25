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

  def place_ships
    puts "Time to place your ships!"
      @board.render
    puts "Please choose 3 coordinates for your cruiser"
      @board.render
      cruiser_input = gets.chomp.upcase
      @board.place(@cruiser, cruiser_input)
    puts "Please choose 2 coordinates for your submarine"
      @board.render
      submarine_input = gets.chomp.upcase
      @board.place(@submarine, submarine_input)
  end


end
