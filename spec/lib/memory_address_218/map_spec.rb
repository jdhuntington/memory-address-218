require File.expand_path('../../../spec_helper', __FILE__)

describe MemoryAddress218::Map do
  before do
    @location   = MemoryAddress218::Location.new(5, -5)
    @card       = MemoryAddress218::Card.new :a
    @card_prime = MemoryAddress218::Card.new :b
    @map        = MemoryAddress218::Map.new
    @map_a      = @map.from_perspective :a
    @map_b      = @map.from_perspective :b
  end
  
  it 'should let me address coordinates and get empty cells' do
    @map.at(@location).should be_nil
  end

  it 'should let me store a card at a location' do
    @map.store @card, @location
    @map.at(@location).should == @card
  end

  describe 'transpose player perspectives' do
    it 'should let me store card at location and retrieve it' do
      @map_b.store @card, @location
      @map_b.at(@location).should == @card
      @map_a.at(@location).should be_nil
    end

    it 'should let me store a card and retrieve it from the other perspective' do
      opposite_location = MemoryAddress218::Location.new(-5, 5)

      @map_b.store @card, opposite_location
      @map_a.at(@location).should == @card

      @map_a.store @card_prime, opposite_location
      @map_b.at(@location).should == @card_prime
    end
    
  end

  describe '#supplied? (supply lines)' do
    it 'should be true for one\'s base' do
      @map_a.supplied?(MemoryAddress218::Location.base, @card).should be_true
      @map_b.supplied?(MemoryAddress218::Location.base, @card_prime).should be_true
    end

    it 'should be false for opponent\'s base' do
      @map_a.supplied?(MemoryAddress218::Location.base, @card_prime).should be_false
      @map_b.supplied?(MemoryAddress218::Location.base, @card).should be_false
    end
  end
end
