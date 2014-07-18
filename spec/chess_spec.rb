require_relative '../lib/chess'
require 'pry'

describe "given a one white pawn world" do

	before :each do
		@w_p=ChessMove.new.piece_team("wP")
	end

	it "[a1 a2] is legal" do
		expect(ChessMove.new.movement(["a", 1], ["a", 2], @w_p)).to eq("LEGAL")
	end

	it "[a1 a4] is illegal" do
		expect(ChessMove.new.movement(["a", 1], ["a", 3], @w_p)).to eq("ILLEGAL")
	end

	it "[a1 b1] is illegal" do
		expect(ChessMove.new.movement(["a", 1], ["b", 1], @w_p)).to eq("ILLEGAL")
	end
end

describe "given a one black pawn world" do

	before :each do
		@b_p=ChessMove.new.piece_team("bP")
	end

	it "[a1 a2] is illegal" do
		expect(ChessMove.new.movement(["a", 1], ["a", 2], @b_p)).to eq("ILLEGAL")
	end

	it "[a8 a7] is legal" do
		expect(ChessMove.new.movement(["a", 8], ["a", 7], @b_p)).to eq("LEGAL")
	end

end

describe "general movement rules applied to all pieces" do
	it "must not go off the board horizontally" do
		
	end
end