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
    puts @board.render
    puts "Please choose 3 coordinates for your cruiser"
      cruiser_input = [gets.chomp.upcase.split(" ")].flatten
      @board.place(@cruiser, cruiser_input)
    puts @board.render(true)
    puts "Please choose 2 coordinates for your submarine"
      submarine_input = [gets.chomp.upcase.split(" ")].flatten
      @board.place(@submarine, submarine_input)
    puts @board.render(true)
  end


end
# require 'pry', binding.pry
