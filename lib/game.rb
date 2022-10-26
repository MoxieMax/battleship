class Game
  attr_reader :player,
              :skynet

  def initialize
    @player = Player.new
    @skynet = Skynet.new
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
    loop do
      ""
      
    end
  end
end

# puts '=============COMPUTER BOARD============='
# print @skynet.board.render
# puts '==============PLAYER BOARD=============='
# print @board.render(true)
