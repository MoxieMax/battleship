require 'spec_helper'

RSpec.describe Turn do
  let (:turn) {Turn.new}
  
  it 'exists' do
    expect(turn).to be_a(Turn)
  end
end