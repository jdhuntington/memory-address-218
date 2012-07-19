class NaivePlayer
  include MemoryAddress218::Player

  def take_turn(turn_number, opts={})
    log "Turn #{turn_number}"
    play_card
  end

  def first_non_airstrike
    hand.reject { |x| x.kind_of?(MemoryAddress218::Card::AirStrike) }.first
  end

  def play_card
    log "Playing card"
    if have_base?
      log "Have a base, building wherever I can"
      build_at
    else
      log "Don't have base, playing one"
      build_base
    end
  end

  def build_base
    MemoryAddress218::Action.new first_non_airstrike, MemoryAddress218::Location.base
  end
end
