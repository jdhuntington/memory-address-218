module MemoryAddress218
  class Game
    attr_reader :map

    def initialize(player_a, player_b)
      @player_a, @player_b = player_a, player_b
      @map = Map.new
      @cards = {
        :a => Cards.new(:allied),
        :b => Cards.new(:german)
      }
      @player_a.opponent = @player_b
      @player_b.opponent = @player_a
    end

    def deck_for(player)
      @cards[player].deck
    end

    def hand_for(player)
      @cards[player].hand
    end
  end
end
