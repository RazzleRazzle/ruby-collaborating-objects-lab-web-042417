require 'pry'

class MP3Importer
  attr_accessor :path, :files

  def initialize(filepath)
    @path = filepath
    @files = []
    #binding.pry
  end

  def files
    directory = Dir.new(@path)
    files = directory.entries
    files.each do |file|
      if file.end_with?("3")
        @files << file
      end
    end
    @files.uniq
  end

  def import
    self.files.each do |file|
      Song.new_by_filename(file)
    end
  end
end
# info = (file.split(/.mp3/))[0].split(/ - /)
# a = Artist.find_or_create_by_name(info[0])
# a.add_song(info[1])
# a.save
