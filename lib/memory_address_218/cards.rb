require File.expand_path('../card', __FILE__)

module MemoryAddress218
  class Cards

    attr_reader :hand, :deck, :cards, :side

    def initialize(side)
      @side  = side
      @cards = self.class.fresh_deck
      @hand  = @cards.select { |c| c.starts_in_hand? }
      @deck  = (@cards - @hand).shuffle
    end

    def self.fresh_deck
      deck = []
      2.times { deck << Card::AirStrike.new     }
      7.times { deck << Card::Infantry.new      }
      5.times { deck << Card::HeavyWeapons.new  }
      3.times { deck << Card::Artillery.new     }
      3.times { deck << Card::Paratroopers.new  }
      3.times { deck << Card::Tank.new          }
      3.times { deck << Card::SpecialForces.new }
      deck
    end
  end
end
