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

    def ==(other)
      @x == other.x && @y == other.y
    end
  end
end
