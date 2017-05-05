require 'pry'
class Artist
  attr_accessor :name, :songs
  @@all = []
  @@switch = nil

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

  def self.find_by_name(name)
    self.all.detect{|artist| artist.name == name}
  end

  def self.find_or_create_by_name(name)
    result = find_by_name(name)
       if result.nil?
         result = Artist.new(name)
         result.save
       end
     result
    end

  def print_songs
    @songs.each {|s| puts s.name }
  end

end
