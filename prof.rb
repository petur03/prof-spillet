
require_relative './piece.rb'
require_relative './board.rb'

NUM_PIECES = 16

pieces = Piece.init

# Piece 5 and 15 are equal
$p15 = pieces.pop # remove piece 15 to avoid duplicate solutions

board = Array.new

$total = 0


def place board, pieces
  if pieces.empty?
#puts "Done"
    puts "Solution: " + $total.to_s
    printBoard board
    puts 
    puts 
    $total = $total+1
#exit(0)
  end
  pieces.each_with_index do |p, i|

    # This is to avoid duplicate slutions from rotated board
    if board.length == 3 || board.length == 12 || board.length == 15
      if p.id < board[0].id
        next
      end
      begin
        if p.id == 15 && (board.length == 15 || (board[3].id == 5 || board[12].id == 5))
          next
        end
      rescue
      end
    end

    4.times do
      if check(board, p)
#printBoard new_b
        board << p
        del = pieces.delete_at(i)
        if (p.id ==5)
          pieces << $p15
        end
        place(board, pieces)
        if (p.id ==5)
          top = pieces.pop
        end
        pieces.insert(i, p)
        board.pop
      end
#puts "Rotating"
      p.rotate
    end
  end
end

place(board, pieces)






