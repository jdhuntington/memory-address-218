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
      @player_a.game     = self
      @player_b.opponent = @player_a
      @player_b.game     = self
      @current_player = [@player_a, @player_b][rand(2)]
      @turn = 1
    end

    def deck_for(player)
      player_ref = resolve_player player
      @cards[player_ref].deck
    end

    def hand_for(player)
      player_ref = resolve_player player
      @cards[player_ref].hand
    end

    def resolve_player(player)
      if player.is_a?(Symbol)
        player
      elsif player == @player_a
        :a
      elsif player == @player_b
        :b
      else
        raise ArgumentError.new("I don't know how to resolve #{player.inspect}.")
      end
    end

    def turn_over!
      if @current_player == @player_a
        @current_player = @player_b
      elsif @current_player == @player_b
        @current_player = @player_a
      else
        raise "I don't even know who's playing this game anymore."
      end
      @turn += 1
    end

    def handle_turn
      actions = @current_player.take_turn @turn
      raise ArgumentError.new("Expected actions to be instances of Action") unless actions.each { |a| a.is_a? Action }
      if @turn == 1 && actions.length != 1
        raise ArgumentError.new("Expected 1 Action for the first turn")
      elsif actions.length != 2
        raise ArgumentError.new("Expected 2 Actions")
      end
    end

    def over?
      map.player_a_occupy_base_b? || map.player_b_occupy_base_a? || cards_gone?
    end

    def cards_gone?
      deck_for(:a).empty? && deck_for(:b).empty? && hand_for(:a).empty? && hand_for(:b).empty?
    end

    def play
      until over? do
        handle_turn
        turn_over!
      end
    end

    def winner
      nil
    end
  end
end
