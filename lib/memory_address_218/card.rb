require 'rainbow'

module MemoryAddress218
  class Card

    attr_accessor :side, :location, :game, :map

    def initialize(side)
      MemoryAddress218.expect_side side
      @side = side
    end

    def super_attack?
      false
    end

    def need_supply?
      true
    end

    def starts_in_hand?
      false
    end

    def fancy_format
      color = side == :a ? :green : :red
      self.class.inspect.split(':').last[0].color(color)
    end

    def supplied?(seen=[])
      if seen.include?(self)
        false
      elsif location == Location.base
        true
      else
        new_seen = seen + [self]
        supplying_neighbors.any? { |n| n.supplied?(new_seen) }
      end
    end

    def supplying_neighbors
      supply.to_directions.map { |d| map.at location.send(d) }.compact
    end

    class Origin < Card
      def initialize(*args)
      end

      def fancy_format
        '#'.color :white
      end
    end

    class AirStrike < Card
      def starts_in_hand?
        true
      end

      def initialize(*args)
        super
      end
    end

    class Infantry < Card
      def initialize(*args)
        super
      end

      def attack
        [ nil , nil , nil ,
          nil , nil , nil ,
          nil , :ja , nil ,
          :ja , :me , :ja ,
          nil , :ja , nil ]
      end

      def support
        [ nil , :ja , nil ,
          :ja , :me , :ja ,
          nil , :ja , nil ]
      end

      def supply
        [ nil , :ja , nil ,
          :ja , :me , :ja ,
          nil , :ja , nil ]
      end
    end

    class HeavyWeapons < Card
      def initialize(*args)
        super
      end
    end

    class Artillery < Card
      def initialize(*args)
        super
      end

      def super_attack?
        true
      end

      def attack
        [ nil , :ja , nil ,
          :ja , :ja , :ja ,
          nil , nil , nil ,
          nil , :me , nil ,
          nil , nil , nil ]
      end

      def support
        [ nil , :ja , nil ,
          :ja , :me , :ja ,
          nil , :ja , nil ]
      end

      def supply
        [ nil , :ja , nil ,
          :ja , :me , :ja ,
          nil , :ja , nil ]
      end
    end

    class Paratroopers < Card
      def initialize(*args)
        super
      end

      def need_supply?
        false
      end

      def attack
        [ nil , nil , nil ,
          nil , nil , nil ,
          nil , :ja , nil ,
          :ja , :me , :ja ,
          nil , :ja , nil ]
      end

      def support
        [ nil , :ja , nil ,
          :ja , :me , :ja ,
          nil , :ja , nil ]
      end

      def supply
        [ nil , :ja , nil ,
          :ja , :me , :ja ,
          nil , :ja , nil ]
      end
    end

    class Tank < Card
      def initialize(*args)
        super
      end

      def super_attack?
        true
      end

      def attack
        [ nil , nil , nil ,
          nil , nil , nil ,
          nil , :ja , nil ,
          :ja , :me , :ja ,
          nil , :ja , nil ]
      end

      def support
        [ nil , :ja , nil ,
          :ja , :me , :ja ,
          nil , :ja , nil ]
      end

      def supply
        [ nil , :ja , nil ,
          :ja , :me , :ja ,
          nil , :ja , nil ]
      end
    end

    class SpecialForces < Card
      def initialize(*args)
        super
      end

      def attack
        [ nil , nil , nil ,
          nil , nil , nil ,
          nil , :ja , nil ,
          :ja , :me , :ja ,
          nil , :ja , nil ]
      end

      def support
        [ nil , :ja , nil ,
          :ja , :me , :ja ,
          nil , :ja , nil ]

      end

      def supply
        [ :ja , nil , :ja ,
          nil , :me , nil ,
          :ja , nil , :ja ]
      end
    end
  end
end
