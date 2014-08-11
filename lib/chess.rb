require 'pry'

RULES = {
  p: [Proc.new { |orig, dest| orig[0] != dest[0] },
      Proc.new { |orig, dest| dest[1] - orig[1] != 1 }],
  r: [Proc.new { |orig, dest| orig[0] != dest[0] && orig[1] != dest[1] }],
  b: [Proc.new { |orig, dest| orig[0] == dest[0] || orig[1] == dest[1] },
      Proc.new { |orig, dest| (orig[0].ord - dest[0].ord).abs != (orig[1] - dest[1]).abs }],
}

module Move
  def self.execute_movement
    @piece.rules.each do |rule|
      return "ILLEGAL" if rule.call(@orig, @dest)
    end
    return "LEGAL"
  end

  def self.a(piece)
    @piece = piece
    self
  end

  def self.from(orig)
    @orig = orig
    self
  end

  def self.to(dest)
    @dest = dest
    self.exchange_positions if @piece.is_a_black_pawn?
    self.execute_movement
  end

  def self.exchange_positions
    new_origin = @dest
    @dest = @orig
    @orig = new_origin
  end
end

class Piece
  def initialize(piece_name)
    @name = piece_name
    @rules = RULES[piece_name[1].downcase.to_sym]
  end

  def rules
    @rules
  end

  def is_a_black_pawn?
    @name == "bP"
  end

end