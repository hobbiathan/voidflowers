
require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV["SPFY_CLIENT_ID"], ENV["SPFY_CLIENT_SECRET"], scope: 'user-read-email playlist-modify-public user-library-read user-library-modify user-read-recently-played user-read-currently-playing'
end

OmniAuth.config.allowed_request_methods = [:post, :get]
