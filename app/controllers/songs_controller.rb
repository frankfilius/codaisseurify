class SongsController < ApplicationController
  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.build
  end

  def create
    artist = Artist.find(params[:artist_id])
    song = artist.songs.create(song_params)
    if song.save
      redirect_to artist, notice: "song created"
    else
      render :new
    end
  end

  def destroy
    artist = Artist.find(params[:artist_id])
    song = artist.songs.find(params[:id])
    song.destroy

    redirect_to artist
  end

  private

  def song_params
    params.require(:song).permit(:name, :album, :release_year)
  end
end