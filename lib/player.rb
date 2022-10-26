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
    self.place_cruiser
    self.place_submarine
  end
  
  def render_board
    @board.render(true)
  end
  
  def place_cruiser
    puts self.render_board
    puts "Please choose 3 coordinates for your cruiser"
    cruiser_input = [gets.chomp.upcase.split(" ")].flatten
    until @board.valid_placement?(@cruiser, cruiser_input) == true && cruiser_input.all?{|coord| self.board.valid_coordinate?(coord)}
      puts "Those are not valid coordinates"
      puts "Please choose 3 coordinates for your cruiser"
      cruiser_input = [gets.chomp.upcase.split(" ")].flatten
    end
    @board.place(@cruiser, cruiser_input)
    puts self.render_board
  end
  
  def place_submarine
    puts "Please choose 2 coordinates for your submarine"
    submarine_input = [gets.chomp.upcase.split(" ")].flatten
    until @board.valid_placement?(@submarine, submarine_input)
      puts "Those are not valid coordinates"
      puts "Please choose 2 coordinates for your submarine"
      submarine_input = [gets.chomp.upcase.split(" ")].flatten
    end
    @board.place(@submarine, submarine_input)
    puts self.render_board
  end
  
  def has_lost?
    @cruiser.sunk? && @submarine.sunk?
  end
end
# require 'pry', binding.pry
