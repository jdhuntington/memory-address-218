module MemoryAddress218
  class Card

    def starts_in_hand?
      false
    end

    class AirStrike
      def starts_in_hand?
        true
      end
    end

    class Infantry < Card
    end

    class HeavyWeapons < Card
    end

    class Artillery < Card
    end

    class Paratroopers < Card
    end

    class Tank < Card
    end

    class SpecialForces < Card
    end
  end
end
