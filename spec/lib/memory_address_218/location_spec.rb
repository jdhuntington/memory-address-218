require File.expand_path('../../../spec_helper', __FILE__)

describe MemoryAddress218::Location do
  it 'should do directionality correctly' do
    l = MemoryAddress218::Location.new(2, 2)

    l.nw.should == MemoryAddress218::Location.new(1,3)
    l.se.should == MemoryAddress218::Location.new(3,1)
    l.ne.should == MemoryAddress218::Location.new(3,3)
    l.sw.should == MemoryAddress218::Location.new(1,1)

    l.w.should  == MemoryAddress218::Location.new(1,2)
    l.s.should  == MemoryAddress218::Location.new(2,1)
    l.e.should  == MemoryAddress218::Location.new(3,2)
    l.n.should  == MemoryAddress218::Location.new(2,3)
  end

  it 'should have directions accessible' do
    MemoryAddress218::Location.directions.length.should == 8
  end
end
