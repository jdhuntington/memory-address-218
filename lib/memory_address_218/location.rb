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
  end
end
