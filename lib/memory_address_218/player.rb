module MemoryAddress218
  module Player
    def opponent=(opponent)
      @opponent = opponent
    end

    def opponent
      @opponent
    end

    def game=(game)
      @game = game
    end

    def game
      @game
    end

    def hand
      game.hand_for self
    end

    def discards
      game.discards_for self
    end

    def take_turn(*args)
      raise "Implement #take_turn in #{self.class.inspect}."
    end

    def base_location
      MemoryAddress218::Location.new(0, -1)
    end

    def have_base?
      map.occupied?(base_location, self)
    end

    def map
      game.map_from_perspective(self)
    end
  end
end
