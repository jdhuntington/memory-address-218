module MemoryAddress218
  class Location
    attr_reader :x, :y

    def initialize(x,y)
      @x,@y = x,y
    end

    def transpose
      self.class.new((x * -1), (y * -1))
    end
  end
end
