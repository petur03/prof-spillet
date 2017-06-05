
LEFT = 0
UP = 1
RIGHT = 2
DOWN = 3

class Piece
  attr_reader :id, :rotation

  def initialize left, up, right, down, id
    @rotation = 0
    @marks = Array.new
    @marks << left
    @marks << up
    @marks << right
    @marks << down
    @id = id
  end
  
  def left
    @marks[(LEFT + @rotation) % 4]
  end
  def up
    @marks[(UP + @rotation) % 4]
  end
  def right
    @marks[(RIGHT + @rotation) % 4]
  end
  def down
    @marks[(DOWN + @rotation) % 4]
  end

  def rotate
    @rotation = (@rotation-1)%4
  end

  def Piece.init
    pieces = Array.new

    pieces << Piece.new(:blh, :brp, :prp, :grh, 0)
    pieces << Piece.new(:prh, :grp, :blp, :brh, 1)
    pieces << Piece.new(:blh, :blp, :brp, :brh, 2)
    pieces << Piece.new(:blh, :brh, :grp, :prp, 3)

    pieces << Piece.new(:prh, :brp, :grp, :blh, 4)
    pieces << Piece.new(:prp, :grh, :blh, :brp, 5)
    pieces << Piece.new(:prh, :blp, :grp, :brh, 6)
    pieces << Piece.new(:blh, :brp, :prp, :brh, 7)

    pieces << Piece.new(:grp, :grp, :brh, :prh, 8)
    pieces << Piece.new(:grp, :blp, :grh, :prh, 9)
    pieces << Piece.new(:brh, :blh, :grp, :prp, 10)
    pieces << Piece.new(:blp, :grh, :grh, :brp, 11)

    pieces << Piece.new(:brp, :prh, :blh, :grp, 12)
    pieces << Piece.new(:blp, :prh, :grh, :brp, 13)
    pieces << Piece.new(:prh, :brp, :grp, :grh, 14)
    pieces << Piece.new(:prp, :grh, :brh, :brp, 15)
    return pieces
  end
end


