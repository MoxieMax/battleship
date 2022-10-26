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
  "#{@skynet.sky_board.sky_render_board}" +
  "==============PLAYER BOARD==============\n" +
  "#{@player.board.render_board(true)}"
  end

  def player_turn
    puts "Enter the coordinate for your shot"
    puts @skynet.sky_board.render(true)
    puts @player.board.render(true)
    loop do
      player_shot = gets.chomp.upcase
      if @player.board.valid_coordinate?(player_shot) && !@player_moves.include?(player_shot)
        @skynet.sky_board.cells[player_shot].fire_upon
        @player_moves << player_shot
        puts @skynet.sky_board.render
        if player_shot.empty?
          puts "Your shot at #{player_shot} was a miss."
          break
        else !player_shot.empty?
          puts "Your shot at #{player_shot} was a hit!"
          break
        end
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
    # loop do
      shot = @skynet.sky_shot
      
      # if !@sky_moves.include?(shot)
        @player.board.cells[shot].fire_upon
        @sky_moves << shot
        puts @player.board.render
      # end
    end
  #   puts "My shot at #{shot} was a #{shot.render}"
  #   puts @player.board.render
  #   if !self.game_over?
  #     self.player_turn
  #   else
  #     puts "Game Over!"
  #   end
  # end

  # require 'pry'; binding.pry

  def game_over?
    if @player.has_lost?
      p "Skynet has won! Bow down before your machine overlord!"
    elsif @skynet.has_lost?
      p "You won! This time."
    else
      false
    end
  end

end
