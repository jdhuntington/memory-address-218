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
  end
end
