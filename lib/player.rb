class Player
  attr_reader :board,
              :cruiser,
              :submarine,
              :skynet,
              :skynet_moves,
              :ships

  def initialize(skynet = false)
    @board = Board.new
    @cruiser = Ship.new('cruiser', 3)
    @submarine = Ship.new('submarine', 2)
    @skynet = skynet
    @skynet_moves = @board.cells.keys
    @ships = [@cruiser, @submarine]
  end
  



















end
