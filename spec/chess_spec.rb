require_relative '../lib/chess'

describe "The movement" do
  it "is illegal if there is no movement" do
    expect(Chess.new.movement([])).to eql('ILLEGAL')
  end
end
