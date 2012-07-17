module MemoryAddress218
  class Map
    def initialize
      @grid = Hash.new { |h,k| h[k] = Hash.new }
    end
    
    def player_a_occupy_base_b?
      false
    end

    def player_b_occupy_base_a?
      false
    end

    def store card, location
      @grid[location.x][location.y] = card
    end

    def at location
      @grid[location.x][location.y]
    end

    def from_perspective player_ref
      if player_ref == :a
        MapProxy.new(self, :transpose => false)
      elsif player_ref == :b
        MapProxy.new(self, :transpose => true)
      else
        raise ArgumentError.new("Don't know about player #{player_ref.inspect}")
      end
    end

    class MapProxy
      def initialize(map, opts={})
        @map = map
        @transpose = !!opts[:transpose]
      end

      def store card, location
        location = location.transpose if @transpose
        @map.store card, location
      end

      def at location
        location = location.transpose if @transpose
        @map.at location
      end
    end
  end
end
