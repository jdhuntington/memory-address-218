module MemoryAddress218
  def self.load_players
    root = File.expand_path('../..', __FILE__)
    Dir[File.join(root, 'players', '**', '*.rb')].each do |player|
      require player
    end
  end
end

require File.expand_path('../memory_address_218/game', __FILE__)
require File.expand_path('../memory_address_218/player', __FILE__)
require File.expand_path('../memory_address_218/map', __FILE__)
require File.expand_path('../memory_address_218/cards', __FILE__)
require File.expand_path('../memory_address_218/action', __FILE__)
require File.expand_path('../memory_address_218/location', __FILE__)
