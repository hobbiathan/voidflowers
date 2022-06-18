class LastfmService

  def self.recent_track
    response = conn.get("")
    format(response)
  end

  private

  def self.conn
    Faraday.new(url: "http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&limit=1&user=hautearchive&api_key=255922c739bb8f8049557990a36b55ac&format=json")
  end

  def self.format(response)
    data = JSON.parse(response.body, symbolize_names: true)
  end
end
