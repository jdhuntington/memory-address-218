module MemoryAddress218
  def self.load_players
    root = File.expand_path('../..', __FILE__)
    Dir[File.join(root, 'players', '**', '*.rb')].each do |player|
      require player
    end
  end

  def self.expect_side(side)
    raise ArgumentError.new("Expected side to be one of :a or :b, instead is #{side.inspect}") unless [:a,:b].include? side
  end

  def self.log(instigator, message)
    STDERR.printf("%15s: %s\n", instigator, message)
  end
end

class Array
  def random
    self[rand(length)]
  end

  def to_directions
    raise "unknown array configuration" if self[4] != :me && length != 9
    directions = []
    [:ne, :n, :nw, :e, :invalid, :w, :se, :s, :sw].each_with_index do |d, i|
      directions << d if self[i] == :ja
    end
    directions
  end
end

require File.expand_path('../memory_address_218/game'           , __FILE__)
require File.expand_path('../memory_address_218/player'         , __FILE__)
require File.expand_path('../memory_address_218/map'            , __FILE__)
require File.expand_path('../memory_address_218/cards'          , __FILE__)
require File.expand_path('../memory_address_218/action'         , __FILE__)
require File.expand_path('../memory_address_218/location'       , __FILE__)
require File.expand_path('../memory_address_218/invalid_action' , __FILE__)
