class HexagonSide
  UPPER_SIDE = 0
  TOP_SIDE = 1
  TOP_RIGHT_SIDE = 2
  BOTTOM_RIGHT_SIDE = 3
  BOTTOM_SIDE = 4
  BOTTOM_LEFT_SIDE = 5
  TOP_LEFT_SIDE = 6
  BOTTOM_SIDE = 7 
  SIDES = 8

NAME= Array.new() 
NAME << "UPPER SIDE"
NAME << "TOP SIDE"
NAME << "TOP RIGHT SIDE"
NAME << "BOTTOM RIGHT SIDE"
NAME << "BOTTOM SIDE"
NAME << "BOTTOM LEFT SIDE"
NAME << "TOP LEFT SIDE"
NAME << "BOTTOM SIDE"

def self.getOpposite(side)
   case side 
      when HexagonSide::UPPER_SIDE then 
        return HexagonSide::BOTTOM_SIDE
      when HexagonSide::TOP_SIDE then 
        return HexagonSide::BOTTOM_SIDE
      when HexagonSide::TOP_RIGHT_SIDE then 
        return HexagonSide::BOTTOM_LEFT_SIDE
      when HexagonSide::BOTTOM_RIGHT_SIDE then 
         return HexagonSide::TOP_LEFT_SIDE
      when HexagonSide::BOTTOM_SIDE then 
        return HexagonSide::TOP_SIDE
      when HexagonSide::BOTTOM_LEFT_SIDE then 
        return HexagonSide::TOP_RIGHT_SIDE
      when HexagonSide::TOP_LEFT_SIDE then 
         return HexagonSide::BOTTOM_RIGHT_SIDE
      when HexagonSide::BOTTOM_SIDE then 
         return HexagonSide::UPPER_SIDE
      else
        return -1
 end
end


end

class Slot

attr_accessor :x
attr_accessor :y
attr_accessor :z
attr_accessor :state

UNCONNECTED = -1
EMPTY_SLOT_WHITE = -2
EMPTY_SLOT_BLACK = -3
EMPTY_SLOT_MIXED = -4
TRAPPED_SLOT = -5
 
def initialize(x,y,z)
  @x,@y,@z = x, y, z  
  yield self
end

def setBoardPosition(x, y,z) 
  @used= true
  @x,@y,@z = x, y,z 
end


def boardPosition
  return @x, @y,@z
end


def neighbour(side)
  return Slot.neighbourCoordinates(@x,@y,@z,side)
end

def forEachNeighbour 
    (0..HexagonSide::SIDES-1).each do |i|
      x, y, z = neighbour(i) 
      if z ==0 || z == 1   #the z index of a piece can only be 0 or 1                    
        yield x, y, z
      end
    end   
end
 
 def self.slotState(white, black) 
     if white == :Neighbour && black == :Neighbour 
       state = EMPTY_SLOT_MIXED
     elsif white == :Neighbour && black == :NotANeighbour 
      state = EMPTY_SLOT_WHITE
     elsif white == :NotANeighbour  && black == :Neighbour
      state = EMPTY_SLOT_BLACK
     elsif white == :NotANeighbour  && black == :NotANeighbour 
      state = UNCONNECTED
     end 
     return state
end  

   
=begin
  [2][3]
  [7][1][4]
    [6][5]
=end  
def self.neighbourCoordinates(x,y,z, side)  
 xdif,ydif, zdif = 0,0,0
 case side 
      when HexagonSide::UPPER_SIDE then 
        xdif, ydif, zdif = 0, 0, 1 
      when HexagonSide::TOP_SIDE then 
        xdif, ydif = -1, -1 
      when HexagonSide::TOP_RIGHT_SIDE then 
        xdif, ydif = 0, -1  
      when HexagonSide::BOTTOM_RIGHT_SIDE then 
        xdif, ydif = 1, 0  
      when HexagonSide::BOTTOM_SIDE then 
        xdif, ydif = 1, 1  
      when HexagonSide::BOTTOM_LEFT_SIDE then 
        xdif, ydif = 0, 1  
      when HexagonSide::TOP_LEFT_SIDE then 
        xdif, ydif = -1, 0 
      when HexagonSide::BOTTOM_SIDE then 
        xdif, ydif, zdif = -1, 0, -1
      else
        raise MoveException, "non existing hexagon side #{side}"
 end
  if x != nil
    return x + xdif, y + ydif, z + zdif  
  else
    return 0, 0, 0
  end
end
  
  
end
