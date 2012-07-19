require 'rainbow'
require 'pp'

module MemoryAddress218
  class Map
    def initialize
      @grid = Hash.new { |h,k| h[k] = Hash.new }
      store Card::Origin.new, Location.origin
    end
    
    def player_a_occupy_base_b?
      false                     # todo
    end

    def player_b_occupy_base_a?
      false                     # todo
    end

    def store card, location
      raise InvalidAction.new("#{location.inspect} occupied") if occupied?(location)
      @grid[location.x][location.y] = card
    end

    def at location
      @grid[location.x][location.y]
    end

    def occupied? location
      !!at(location)
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

    def base_location side
      MemoryAddress218.expect_side side
      side == :a ? Location.base : Location.base.transpose
    end

    def supplied?(location, card=nil)
      if occupied?(location) && card
        raise InvalidAction.new("Can't check for supply chain for card on occupied location")
      elsif card                   # Checking new card
        if base_location(card.side) == location
          true
        else
          # TODO
          false                 # Check supply chain to new card
        end
      else                      # Check supply chain to existing card
        false
      end
    end

    def log_state
      MemoryAddress218.log("Map", "\n#{fancy_format}")
    end

    def height
      heights = []
      @grid.each { |x, y_col| heights << y_col.keys.length }
      heights.max
    end

    def min_y
      min_ys = []
      @grid.each { |x, y_col| min_ys << y_col.keys.min }
      min_ys.compact.min
    end

    def width
      @grid.values.length
    end

    def min_x
      @grid.keys.min
    end

    def fancy_format
      output = ''
      0.upto(height - 1) do |y|
        0.upto(width - 1) do |x|
          l = Location.new(x + min_x, y + min_y)
          c = at l
          if c
            output += c.fancy_format
          else
            output += '.'
          end
          output += ' '
        end
        output += "\n"
      end
      output
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

      def supplied?(location, card=nil)
        location = location.transpose if @transpose
        @map.supplied? location, card
      end

      def occupied?(location)
        MemoryAddress218.log("map-occupied", "Checking #{location.fancy_format}")
        location = location.transpose if @transpose
        MemoryAddress218.log("map-occupied", "Checking #{location.fancy_format}")
        @map.occupied? location
      end
    end
  end
end
