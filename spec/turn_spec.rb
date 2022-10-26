require 'spec_helper'

RSpec.describe Turn do
  let (:player) {Player.new}
  let (:skynet) {Skynet.new}
  let (:turn) {Turn.new(player, skynet)}
  
  it 'exists' do
    expect(turn).to be_a(Turn)
  end
  
  it 'has readable attributes' do
    expect(turn.player).to eq(player)
    expect(turn.player_moves).to eq([])
    expect(turn.skynet).to eq(skynet)
    expect(turn.sky_moves).to eq([])
  end
  
  it 'can determine if a player has lost' do
    player.cruiser.hit
    player.cruiser.hit
    player.cruiser.hit
    player.submarine.hit
    
    expect(turn.game_over?).to eq(false)
    player.submarine.hit
    expect(turn.game_over?).to eq('Skynet has won! Bow down before your machine overlord!')
  end
  
  xit 'can render board results' do
  end
end