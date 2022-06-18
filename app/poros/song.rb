class Song
  attr_reader :title, :album, :link, :artist

  def initialize(data)
    @title = data[:track][:name].downcase
    @album = data[:track][:album][:name].downcase
    @link = data[:track][:external_urls][:spotify].gsub("/track", "/embed/track")
    @artist = data[:track][:artists][0][:name].downcase
  end
end
