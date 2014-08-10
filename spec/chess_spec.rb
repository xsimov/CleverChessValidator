require_relative '../lib/chess'
require 'pry'

describe "One piece on the board world: " do
    
  before :each do
    @w_p=Piece.new("wP")
    @b_p=Piece.new("bP")
    @b_r = Piece.new("bR")
    @w_b = Piece.new("wB")
  end

  context "A pawn:" do
      it "moving more than one tile is illegal" do
        expect(Move.a(@w_p).from(["a", 1]).to(["a", 4])).to eq("ILLEGAL")
      end

      it "changing the column is illegal" do
        expect(Move.a(@w_p).from(["a", 1]).to(["b", 1])).to eq("ILLEGAL")
      end

      context "the white one:" do
        it "moving forward is legal" do
          expect(Move.a(@w_p).from(["a", 1]).to(["a", 2])).to eq("LEGAL")
        end

        it "moving backward is illegal" do
          expect(Move.a(@w_p).from(["a", 2]).to(["a", 1])).to eq("ILLEGAL")
        end
      end

      context "the black one:" do
        it "moving forward is illegal" do
          expect(Move.a(@b_p).from(["a", 1]).to(["a", 2])).to eq("ILLEGAL")
        end

        it "moving backward is legal" do
          expect(Move.a(@b_p).from(["a", 8]).to(["a", 7])).to eq("LEGAL")
        end
      end
  end

  context "A rock:" do
    it "moving in diagonal is illegal" do
      expect(Move.a(@b_r).from(["a", 2]).to(["b",8])).to eq("ILLEGAL")
      expect(Move.a(@b_r).from(["a", 1]).to(["a", 8])).to eq("LEGAL")
      expect(Move.a(@b_r).from(["a", 2]).to(["f", 2])).to eq("LEGAL")
    end
  end

  context "A bishop:" do
    it "not moving in diagonal is illegal" do
      expect(Move.a(@w_b).from(["a", 3]).to(["a", 2])).to eq("ILLEGAL")
      expect(Move.a(@w_b).from(["a", 3]).to(["f", 3])).to eq("ILLEGAL")
    end

    it "moving in a delta different than one is illegal" do
      expect(Move.a(@w_b).from(["a", 2]).to(["b", 5])).to eq("ILLEGAL")
    end
  end

  
end