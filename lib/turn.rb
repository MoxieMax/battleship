class Turn
  attr_reader :player,
              :player_moves,
              :skynet,
              :sky_moves
              :sky_poss_moves

  def initialize(player, skynet)
    @player = player
    @player_moves = []
    @skynet = skynet
    @sky_moves = []
    @sky_poss_moves = @skynet.sky_moves
  end

  def render_result
  "==============SKYNET BOARD==============\n" +
  "#{@skynet.sky_board.render}" +
  "==============PLAYER BOARD==============\n" +
  "#{@player.board.render(true)}"
  end

  def final_result
  "==============SKYNET BOARD==============\n" +
  "#{@skynet.sky_board.render(true)}" +
  "==============PLAYER BOARD==============\n" +
  "#{@player.board.render(true)}"
  end

  def player_turn
    puts "Enter the coordinate for your shot"
    loop do
      player_shot = gets.chomp.upcase
      if @player.board.valid_coordinate?(player_shot) && !@player_moves.include?(player_shot)
        @skynet.sky_board.cells[player_shot].fire_upon
        @player_moves << player_shot
        if @skynet.sky_board.cells[player_shot].empty?
          puts "Your shot at #{player_shot} was a miss."
          break
        else !@skynet.sky_board.cells[player_shot].empty?
          puts "Your shot at #{player_shot} was a hit!"
          break
        end
        break
      elsif
        !@player.board.valid_coordinate?(player_shot)
        puts "That is not a valid coordinate"
      elsif @player_moves.include?(player_shot)
        puts "You've already used that one"
      end
      break
    end
  end

  def skynet_turn
    shot = @skynet.sky_shot
    @player.board.cells[shot].fire_upon
    @sky_moves << shot
    puts self.render_result
    if @player.board.cells[shot].empty?
      puts "My shot at #{shot} was a miss."
    else !@player.board.cells[shot].empty?
      puts "My shot at #{shot} was a hit!"
    end

  end

  # require 'pry'; binding.pry

  def game_over?
    if @player.has_lost?
      p "Skynet has won! Bow down before your machine overlord!"
    #  puts self.final_result
    elsif @skynet.has_lost?
      p "You won! This time."
    #  puts self.final_result
    end
  end

end
