class Game
  attr_reader :player,
  :computer

  def initialize
    @player = Player.new
    @computer = Player.new(true)
  end

  def start
    puts "WELCOME TO BATTLESHIP"
    puts "----------------------------"
    puts "enter P to play or Q to quit"
    loop do
      player_input = gets.chomp.downcase
      if player_input == "p"
        "Play"#skynet board setup!
        break
      elsif player_input == "q"
        return puts "Loser lol"
      else
      puts "no valid input, please press P to play or Q to quit!"
      end
    end


  end






end
