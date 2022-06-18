require './app/poros/song'

class SpotifyFacade
  def self.get_recent
    Song.new(SpotifyService.recently_played)
  end
end
