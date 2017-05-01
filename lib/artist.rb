require 'pry'
class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    theprince = nil
    self.all.each do |artist|
      if artist.name == name
        theprince = artist
      else
        theprince = self.new(name)
      end
    end
    theprince 
  end

  def print_songs
    @songs.each {|s| puts s.name }
  end

end
