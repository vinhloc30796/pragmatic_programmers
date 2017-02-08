# classes.rb

# This file defines the classes of Pragmatic Programmers' Jukebox

class Song
  @@plays = 0
  
  def initialize(name, artist, duration)
    @name     = name
    @artist   = artist
    @duration = duration
    @plays    = 0
  end
  
  def to_s
    "Song: #@name--#@artist (#@duration)"
  end
  
  def play
    @plays  += 1
    @@plays += 1
    "This song: #@plays plays. Total #@@plays plays."
  end
  
  def duration_in_minutes
    @duration/60.0
  end
  def duration_in_minutes= (new_duration)
    @duration = (new_duration*60).to_i
  end
  
  attr_reader :name, :artist, :duration
  attr_writer :duration
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

class SongList
  MAX_TIME = 5*60
  
  def initialize()
    @songs = Array.new
  end
  
  def append(song)
    @songs.push(song)
    self
  end
  
  def delete_first()
    @songs.shift
  end
  
  def delete_last()
    @songs.pop
  end
  
  def [](index)
    @songs[index]
  end
  
  def SongList.is_too_long(song)
    song.duration > MAX_TIME
  end
  
  def with_title(title)
    @songs.find { |song| title == song.name }
  end
end

class MyLogger
  private_class_method :new
  @@logger = nil
  
  def MyLogger.create
    @@logger = new unless @@logger
    @@logger
  end
end

song1 = Song.new("Bicyclops", "Fleck", 260)
puts song1.to_s
song1.duration = 257
puts "%s %s %s" % [song1.artist, song1.name, song1.duration]
puts song1.duration_in_minutes
song1.duration_in_minutes = 4.2
puts song1.duration

song2 = KaraokeSong.new("My Way", "Sinatra", 225, "And now, the...")
puts song2.to_s

# Testing play function
puts song1.play
puts song2.play
puts song1.play
puts song1.play

# Testing is_too_long class function
puts SongList.is_too_long(song1)
puts SongList.is_too_long(song2)
song2.duration = 468
puts SongList.is_too_long(song2)

# Testing MyLogger.create.object_id
puts MyLogger.create.object_id
puts MyLogger.create.object_id

# Testing SongList with TestUnit
load 'jukebox_testing.rb'