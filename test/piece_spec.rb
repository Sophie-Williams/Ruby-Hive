$LOAD_PATH.unshift( File.join( File.dirname(__FILE__), '../Common' ) )
$LOAD_PATH.unshift( File.join( File.dirname(__FILE__), '../Common/Insects' ) )
$LOAD_PATH.unshift( File.join( File.dirname(__FILE__), '../Common/MoveValidators' ) )
$LOAD_PATH.unshift( File.join( File.dirname(__FILE__), '..' ) )

require '../Common/piece.rb'

describe Hive::Piece do
   
   before :each do 
      #@queen_bee= QueenBee.new()
      #@beetle= Beetle.new()
      #@spider= Spider.new()
      #@gras_hopper= GrassHopper.new()
      #@ant= Ant.new()
      #@mosquito= Mosquito.new()
   end 

   it 'should provide neighbours correctly' do 
   
   end
   
end
