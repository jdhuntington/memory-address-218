module MemoryAddress218
  class Action
    def initialize(card, location, attack=nil)
      @card, @location, @attack = card, location, attack
      raise ArgumentError.new("card must be a Card, instead is a #{card.class.inspect}") unless @card.is_a?(Card)
      raise ArgumentError.new("location must be a Location, instead is a #{location.class.inspect}") unless @location.is_a?(Location)
    end
  end
end
