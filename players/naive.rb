class NaivePlayer
  include MemoryAddress218::Player

  def take_turn(turn_number)
    return first_turn if turn_number == 1
  end

  def first_turn
    location = MemoryAddress218::Location.new(0, -1)
    card     = hand.reject { |x| x.kind_of?(MemoryAddress218::Card::AirStrike) }.first
    [MemoryAddress218::Action.new(card, location)]
  end
end
