module MemoryAddress218
  class Card

    attr_accessor :side

    def initialize(side)
      MemoryAddress218.expect_side side
      @side = side
    end

    def starts_in_hand?
      false
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
    end

    class Paratroopers < Card
      def initialize(*args)
        super
      end
    end

    class Tank < Card
      def initialize(*args)
        super
      end
    end

    class SpecialForces < Card
      def initialize(*args)
        super
      end
    end
  end
end
