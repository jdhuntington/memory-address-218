require File.expand_path('../../../spec_helper', __FILE__)

describe MemoryAddress218::Game do
  before do
    @player_a = DummyPlayer.new
    @player_b = DummyPlayer.new
    @game = MemoryAddress218::Game.new @player_a, @player_b
  end

  it 'should contain deck for each player' do
    @game.deck_for(:a).length.should == 24
    @game.deck_for(:b).length.should == 24
  end

  it 'should contain a hand of 2 air strikes for each player' do
    @game.hand_for(:a).map(&:class).should == [MemoryAddress218::Card::AirStrike, MemoryAddress218::Card::AirStrike]
  end

  it 'should have a map' do
    @game.map.should be_a_kind_of(MemoryAddress218::Map)
  end

  it 'should initialize each player with an opponent' do
    @player_a.opponent.should == @player_b
    @player_b.opponent.should == @player_a
  end
end
