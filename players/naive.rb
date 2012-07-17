class NaivePlayer
  include MemoryAddress218::Player

  def take_turn(turn_number)
    action_count = turn_number == 1 ? 1 : 2
    actions = []
    action_count.times do
      actions << play_card
    end
    actions
  end

  def first_non_airstrike
    hand.reject { |x| x.kind_of?(MemoryAddress218::Card::AirStrike) }.first
  end

  def play_card
    if have_base?
      build_at
    else
      build_base
    end
  end

  def build_base
    MemoryAddress218::Action.new(first_non_airstrike, base_location)
  end
end
