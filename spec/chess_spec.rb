require_relative '../lib/chess'
require 'pry'

describe "One piece on the board world: " do
    
  before :each do
    @w_p = Piece.new("wP")
    @b_p = Piece.new("bP")
    @b_r = Piece.new("bR")
    @w_b = Piece.new("wB")
  end

  context "A pawn:" do
      it "moving more than one tile is illegal" do
        expect(@w_p.from(["a", 1]).to(["a", 4]).check_legality).to eq("ILLEGAL")
      end

      it "changing the column is illegal" do
        expect(@w_p.from(["a", 1]).to(["b", 1]).check_legality).to eq("ILLEGAL")
      end

      context "the white one:" do
        it "moving forward is legal" do
          expect(@w_p.from(["a", 1]).to(["a", 2]).check_legality).to eq("LEGAL")
        end

        it "moving backward is illegal" do
          expect(@w_p.from(["a", 2]).to(["a", 1]).check_legality).to eq("ILLEGAL")
        end
      end

      context "the black one:" do
        it "moving forward is illegal" do
          expect(@b_p.from(["a", 1]).to(["a", 2]).check_legality).to eq("ILLEGAL")
        end

        it "moving backward is legal" do
          expect(@b_p.from(["a", 8]).to(["a", 7]).check_legality).to eq("LEGAL")
        end
      end
  end

  context "A rock:" do
    it "moving in diagonal is illegal" do
      expect(@b_r.from(["a", 2]).to(["b", 8]).check_legality).to eq("ILLEGAL")
      expect(@b_r.from(["a", 2]).to(["a", 8]).check_legality).to eq("LEGAL")
      expect(@b_r.from(["a", 2]).to(["f", 2]).check_legality).to eq("LEGAL")
    end
  end

  context "A bishop:" do
    it "not moving in diagonal is illegal" do
      expect(@w_b.from(["a", 3]).to(["a", 2]).check_legality).to eq("ILLEGAL")
      expect(@w_b.from(["a", 3]).to(["f", 3]).check_legality).to eq("ILLEGAL")
    end

    it "moving in a delta different than one is illegal" do
      expect(@w_b.from(["a", 2]).to(["b", 5]).check_legality).to eq("ILLEGAL")
    end
  end

end