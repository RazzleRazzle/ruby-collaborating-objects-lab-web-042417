require 'pry'
class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    split_parts = filename.split(' - ')
    new_song = self.new(split_parts[1])
    new_artist = Artist.find_or_create_by_name(split_parts[0])
    new_artist.songs << new_song 
    new_song.artist = new_artist
    new_song
  end
end
