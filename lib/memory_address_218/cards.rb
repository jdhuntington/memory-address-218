require File.expand_path('../card', __FILE__)

module MemoryAddress218
  class Cards

    attr_reader :hand, :deck, :cards, :side

    def initialize(side)
      @side  = side
      @cards = self.class.fresh_deck side
      @hand  = @cards.select { |c| c.starts_in_hand? }
      @deck  = (@cards - @hand).shuffle
    end

    def draw_initial_hand
      3.times { draw_card }
    end

    def draw(turn)
      times = turn == 1 ? 1 : 2
      MemoryAddress218.log("Cards(#{side})", "Drawing #{times}")
      times.times { draw_card }
    end

    def draw_card
      @hand << @deck.shift
    end

    def self.fresh_deck side
      deck = []
      2.times { deck << Card::AirStrike.new(side)     }
      7.times { deck << Card::Infantry.new(side)      }
      5.times { deck << Card::HeavyWeapons.new(side)  }
      3.times { deck << Card::Artillery.new(side)     }
      3.times { deck << Card::Paratroopers.new(side)  }
      3.times { deck << Card::Tank.new(side)          }
      3.times { deck << Card::SpecialForces.new(side) }
      deck
    end
  end
end
