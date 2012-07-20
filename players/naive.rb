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
      card_i_will_play = first_non_airstrike
      map.cards_in_play.each do |location, card|
        MemoryAddress218::Location.directions.shuffle.each do |dir|
          new_location = location.send(dir)
return MemoryAddress218::Action.new(card_i_will_play, l) if supplied?(new_location, card_i_will_play) && !occupied?(new_location)
        end
      end
      raise "I can't play anywhere. :("
    else
      log "Don't have base, playing one"
      build_base
    end
  end

  def build_base
    MemoryAddress218::Action.new first_non_airstrike, MemoryAddress218::Location.base
  end
end
