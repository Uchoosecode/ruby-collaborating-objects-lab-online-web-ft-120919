

class Artist 
  
  attr_accessor :name 
  
  @@all = []
  def initialize(name)
    @name = name
    @@all << self 
    @songs = []
  end
  
  def self.all 
    @@all
  end
  
  def songs 
    Song.all.select {|song| song.artist == self}
  end
  
  def add_song(song)
    song.artist= self
  end
  
  def self.find_or_create_by_name(song)
    if self.find(name)
      @@all.find {|artist|
      artist.name == name}
      
    else
      self.create(name)
    end
  end
  
  
  
  def self.create(name)
    artist = Artist.new(name)
    artist.add_song(song)
    artist
  end
end