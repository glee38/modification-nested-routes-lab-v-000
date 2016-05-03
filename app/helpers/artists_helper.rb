module ArtistsHelper
  def display_artist(song)
    song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
  end

  def artist_select(song, artist)
    if artist.nil?
      select_tag "song[artist_id]", options_from_collection_for_select(Artist.all, :id, :name)
    else
      artist.name
    end
  end

  # solution on learn
  # added @nested = true flag to post#edit if params[:artist_id]
  # seems a little roundabout - above solution does not need the flag and does the same thing because logically, if there is a @song.artist, then it is nested

  # def artist_select(nested, song)
  #   if nested
  #     song.artist.name
  #   else
  #     select_tag "song[artist_id]", options_from_collection_for_select(Artist.all, :id, :name)
  #   end
  # end

end
