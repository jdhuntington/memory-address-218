module MemoryAddress218
  class Location
    attr_reader :x, :y

    def initialize(x,y)
      @x,@y = x,y
    end

    def transpose
      self.class.new((x * -1), (y * -1))
    end

    def self.base
      new(0, -1)
    end

    def self.origin
      new(0, 0)
    end

    def fancy_format
      [x,y].inspect
    end

    def ==(other)
      @x == other.x && @y == other.y
    end

    def origin?
      self == self.class.origin
    end

    DIRECTIONS = {
      :n  => [ 0,  1],
      :nw => [-1,  1],
      :w  => [-1,  0],
      :sw => [-1, -1],
      :s  => [ 0, -1],
      :se => [ 1, -1],
      :e  => [ 1,  0],
      :ne => [ 1,  1]
    }

    def self.directions
      DIRECTIONS.keys
    end

    DIRECTIONS.each do |name, coords|
      define_method name do
        self.class.new(x + coords.first, y + coords.last)
      end
    end
  end
end
