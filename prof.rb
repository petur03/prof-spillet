
require_relative './piece.rb'
require_relative './board.rb'

NUM_PIECES = 16

pieces = Piece.init

board = Array.new

@@total = 0


def place board, pieces
  if pieces.empty?
#puts "Done"
    puts "Solution: " + @@total.to_s
    printBoard board
    puts 
    puts 
    @@total = @@total+1
#exit(0)
  end
  pieces.each do |p|
    4.times do |i|
      if check(board, p)
        if board.length >10
#puts "Placing... " + board.length.to_s
        end
        new_b = board.clone
        new_b << p
#printBoard new_b
        new_p = pieces.clone
        new_p.delete(p)
        place(new_b, new_p)
      end
#puts "Rotating"
      p.rotate
    end
  end
end

place(board, pieces)






