# jukebox_executing.rb

load "jukebox_classes.rb"

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

# Testing Button class and JukeboxButton subclass
start_button = JukeboxButton.new("Start") { list.start }
pause_button = JukeboxButton.new("Pause") { list.pause }

# Test VU class
medium_volume = VU.new(4)..VU.new(7)
print "#{medium_volume.to_a}\n"
puts medium_volume.include?(VU.new(3))

# Test Comparable mixin

puts song1 <=> song2
puts song1  <  song2
puts song1 ==  song2
puts song1  >  song2