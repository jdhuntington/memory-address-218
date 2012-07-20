require File.expand_path('../../spec_helper', __FILE__)

describe MemoryAddress218 do
  describe 'Array#to_directions' do
    it 'should know cardinal directions' do
      a = [ nil , :ja , nil ,
            :ja , :me , :ja ,
            nil , :ja , nil ]
      a.to_directions.sort.should == [:n, :e, :s, :w].sort
    end

    it 'should know diagonal directions' do
      a = [ :ja , nil , :ja ,
            nil , :me , nil ,
            :ja , nil , :ja ]
      a.to_directions.sort.should == [:ne, :se, :sw, :nw].sort
    end
  end
end
