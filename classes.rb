# classes.rb

# This file defines the classes of Pragmatic Programmers' Jukebox

class Song
  def initialize(name, artist, duration)
    @name     = name
    @artist   = artist
    @duration = duration
  end
  
  def to_s
    "Song: #@name--#@artist (#@duration)"
  end
end

class KaraokeSong < Song
  def initialize(name, artist, duration, lyrics)
    super(name, artist, duration)
    @lyrics = lyrics
  end
  
  def to_s
    super + " [#@lyrics]"
  end
end

song1 = Song.new("Bicyclops", "Fleck", 260)
p song1.to_s

song2 = KaraokeSong.new("My Way", "Sinatra", 225, "And now, the...")
p song2.to_s