class Game
  attr_reader :player,
              :skynet
              :turn

  def initialize
    @player = Player.new
    @skynet = Skynet.new
    @turn = Turn.new(@player, @skynet)
  end

  def start
    puts "WELCOME TO BATTLESHIP"
    puts "----------------------------"
    puts "Enter P to play or Q to quit"
    loop do
      player_input = gets.chomp.downcase
      if player_input == "p"
        @player.place_ships#skynet board setup!
        @skynet.sky_place_ships
        @skynet.sky_render_board
        break
      elsif player_input == "q"
        return puts "Loser lol"
      else
      puts "Not a valid input, please press P to play or Q to quit!"
      end
    end
    self.turns
  end
  
  def turns
    @turn.player_turn
  end
end
