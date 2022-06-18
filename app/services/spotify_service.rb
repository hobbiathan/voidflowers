require 'rspotify'
class SpotifyService
    def self.user_authorize
      response = conn("https://accounts.spotify.com/").get("/authorize") do |req|
        req.params["client_id"] = ENV["SPFY_CLIENT_ID"]
        req.params["response_type"] = "code"
        req.params["redirect_uri"] = "https://voidflowers.io"
        req.params["state"] = "state"
      end

      format(response)
    end

  private

  def self.conn(param)
    Faraday.new(url: param)
  end

  def self.format(response)
    data = JSON.parse(response.body, symbolize_names: true)
  end


end
