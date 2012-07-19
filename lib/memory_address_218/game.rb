module MemoryAddress218
  class Game
    attr_reader :map

    def initialize(player_a, player_b)
      @player_a, @player_b = player_a, player_b
      @map = Map.new
      @cards = {
        :a => Cards.new(:a),
        :b => Cards.new(:b)
      }
      @player_a.opponent = @player_b
      @player_a.game     = self
      @player_b.opponent = @player_a
      @player_b.game     = self
      @current_player = [@player_a, @player_b][rand(2)]
      @turn = 1
    end

    def log(msg)
      MemoryAddress218.log('Game', msg)
    end

    def cards_for(player)
      player_ref = resolve_player player
      @cards[player_ref]
    end

    def deck_for(player)
      cards_for(player).deck
    end

    def hand_for(player)
      cards_for(player).hand
    end

    def map_from_perspective(player)
      player_ref = resolve_player player
      map.from_perspective player_ref
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
      log("#turn_over!")
      if @current_player == @player_a
        @current_player = @player_b
      elsif @current_player == @player_b
        @current_player = @player_a
      else
        raise "I don't even know who's playing this game anymore."
      end
      @turn += 1
    end

    def commit action
      my_map = map_from_perspective(@current_player)
      my_map.store action.card, action.location
      map.log_state
    end

    def handle_turn
      cards_for(@current_player).draw(@turn)
      expected_actions = @turn == 1 ? 1 : 2
      taken_actions    = 0
      actions          = []
      until taken_actions >= expected_actions
        received = @current_player.take_turn @turn, :expected_actions => expected_actions - taken_actions
        actions += [received].flatten
        raise ArgumentError.new("Expected actions to be instances of Action") unless actions.each { |a| a.is_a? Action }
        log "Got #{actions.length} actions back for turn #{@turn}."
        actions.each_with_index { |a, i| log "Action #{i}: #{a.fancy_format}" }
        actions.each do |a|
          raise InvalidAction.new("Too many actions") if taken_actions >= expected_actions
          commit a
          taken_actions += 1
        end
      end
    end

    def over?
      map.player_a_occupy_base_b? || map.player_b_occupy_base_a? || cards_gone?
    end

    def cards_gone?
      deck_for(:a).empty? && deck_for(:b).empty? && hand_for(:a).empty? && hand_for(:b).empty?
    end

    def play
      @cards.values.each(&:draw_initial_hand)
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
