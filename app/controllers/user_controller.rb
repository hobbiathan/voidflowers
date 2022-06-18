class UserController < ApplicationController
  def index
    if Current.user
      @user = User.find(Current.user.id)
    end
  end

  def spotify
    a = RSpotify::User.new(request.env['omniauth.auth'])
      data = RSpotify::User.new(request.env['omniauth.auth']).recently_played(limit: 1)
      song = Song.create!(title: data[0].name, album: data[0].album.name, link: data[0].external_urls["spotify"], artist: data[0].artists[0].name)

      if !song.save
        @info = { title: data[0].name }
      else
        @info = { title: nil }
      end

      redirect_to controller: "projects", action: "index", data: @info
  end

  def song_params
    params.permit(:title, :album, :link, :artist)
  end
end
