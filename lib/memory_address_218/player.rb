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

    def have_base?
      map.occupied? Location.base
    end

    def map
      game.map_from_perspective(self)
    end

    def log(msg)
      MemoryAddress218.log(self.class.inspect, msg)
    end

    def cards_in_play
      game.cards_in_play(self)
    end
  end
end
