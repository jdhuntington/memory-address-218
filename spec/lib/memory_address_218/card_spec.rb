require File.expand_path('../../../spec_helper', __FILE__)

describe MemoryAddress218::Card do

  before do
    real_map   = MemoryAddress218::Map.new
    @map       = real_map.from_perspective :a
    @infantry0 = MemoryAddress218::Card::Infantry.new(:a)
    @infantry1 = MemoryAddress218::Card::Infantry.new(:a)
    @infantry2 = MemoryAddress218::Card::Infantry.new(:a)
    @infantry3 = MemoryAddress218::Card::Infantry.new(:a)
    @map.store @infantry0, MemoryAddress218::Location.base
    @map.store @infantry1, MemoryAddress218::Location.base.e
    @map.store @infantry2, MemoryAddress218::Location.base.e.s.s
    @map.store @infantry3, MemoryAddress218::Location.base.e.s.s.e
  end

  describe '#supplied? (supply lines)' do
    it 'should be true for one\'s base' do
      @infantry0.should be_supplied
    end

    it 'should be true for infantry next to one\'s base' do
      @infantry1.should be_supplied
    end

    it 'should not be true for an isolated card' do
      @infantry2.should_not be_supplied
      @infantry3.should_not be_supplied
    end
  end
end
