
def printBoard board
  i = 1
  board.each do |p|
    print p.id.to_s + "(" + p.rotation.to_s + ") "
    if (i%4==0)
      print "\n"
    end
    i = i+1
  end
  puts ""
end

def check board, piece
  i = board.length

  case i
  when 0
    true
  when (1..3)
    match board[i-1].right, piece.left
  when 4, 8, 12
    match board[i-4].down, piece.up
  when 5,6,7, 9,10,11,13,14,15
    match(board[i-1].right, piece.left) &&
      match(board[i-4].down, piece.up)
  else
    puts "Unknown index!!" + i.to_s
    exit
  end
end

def match mark1, mark2
  (mark1==:blh && mark2==:blp) ||
  (mark1==:blp && mark2==:blh) ||

  (mark1==:brh && mark2==:brp) ||
  (mark1==:brp && mark2==:brh) ||
  
  (mark1==:grh && mark2==:grp) ||
  (mark1==:grp && mark2==:grh) ||

  (mark1==:prh && mark2==:prp) ||
  (mark1==:prp && mark2==:prh)
end



