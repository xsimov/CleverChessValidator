require 'pry'

class ChessMove
	def piece_team(piece_name)
		w_pawnRules = [Proc.new { |orig, dest| orig[0]!=dest[0] }, Proc.new { |orig, dest| dest[1]-orig[1] != 1 }]
		b_pawnRules = [Proc.new { |orig, dest| orig[0]!=dest[0] }, Proc.new { |orig, dest| orig[1]-dest[1] != 1 }]
		return w_pawnRules if piece_name[0] == "w"
		return b_pawnRules
	end
	def movement(orig, dest, piece_rules)
		piece_rules.each do |rule|
			return "ILLEGAL" if rule.call(orig, dest)
		end
		return "LEGAL"
	end
end