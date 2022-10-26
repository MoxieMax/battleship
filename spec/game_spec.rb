require 'spec_helper'

RSpec.describe Game do
  let (:game) {Game.new}
  
  it 'exists' do
    expect(game).to be_a(Game)
  end
end