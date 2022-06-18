class Song
  attr_reader :title, :album, :link, :artist

  def initialize(data)
    @title = data["title"].downcase
    @album = data["album"].downcase
    @link = data["link"].gsub("/track", "/embed/track")
    @artist = data["artist"].downcase
  end
end
