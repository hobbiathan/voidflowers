class SpotifyService

  def self.recently_played
    response = conn.get do |req|
      req.headers["Authorization"] = ENV["SPFY_TKN"]
      req.headers["Content-Type"] = "application/json"
      req.params["limit"] = "1"
    end

    format(response)[:items][0]
  end

  private

  def self.conn
    Faraday.new(url: "https://api.spotify.com/v1/me/player/recently-played")
  end

  def self.format(response)
    data = JSON.parse(response.body, symbolize_names: true)
  end
end
