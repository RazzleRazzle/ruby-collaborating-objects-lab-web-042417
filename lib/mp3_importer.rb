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

  def parser
  end

  def import
    self.files.each do |file|
      words = file.split(/.mp3/)
      parse = words[0].split(/ - /)
      Song.new(parse[1])

    end
  end

end
