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
  
  def set_start_time(from_time)
    #placeholder
  end
  
  def [](from_time, to_time)
    result = Song.new(self.title + " [extract]",
                      self.artist,
                      to_time - from_time)
    result.set_start_time(from_time)
    result
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
  def duration= (new_duration)
    @duration = new_duration
  end
  
  def mixed_case(name)
    name.gsub(/\b\w/) { |first| first.upcase }
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
    @index = WordIndex.new
  end
  
  def append(song)
    @songs.push(song)
    @index.add_to_index(song, song.name, song.artist)
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
  
  def lookup(word)
    @index.lookup(word)
  end
  
  def start()
    puts "Playing song list..."
    [1..@songs.length].each { |index| puts "#{index}. #{@songs[index-1]}" }
  end
  
  def pause()
    puts "Pausing song list...."
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

class Button
  def initialize(label)
    @label = label
  end
end

class JukeboxButton < Button
  def initialize(label, &action)
   super(label)
   @action = action
  end
  
  def button_pressed
    @action.call(self)
  end
end

class WordIndex
  def initialize
    @index = {}
  end
  
  def add_to_index(obj, *phrases)
    phrases.each do |phrase|
      phrase.scan(/\w[-\w']+/) do |word|
        word.downcase!
        @index[word] = [] if @index[word].nil?
        @index[word].push(obj)
      end
    end
  end
  
  def lookup(word)
    @index[word.downcase]
  end
end

class VU
  include Comparable
  
  attr :volume
  
  def initialize(volume) # 0..9
    @volume = volume
  end
  
  def inspect
    '#' * @volume
  end
  
  # Support for ranges
  
  def <=>(other)
    self.volume <=> other.volume
  end
  
  def succ
    raise(IndexError, "Volume too big") if @volume >= 9
    VU.new(@volume.succ)
  end
end