#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer

# my_songs = {
# "Go Go GO" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/01.mp3',
# "LiberTeens" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/02.mp3',
# "Hamburg" =>  '< path to this directory >/jukebox-cli/audio/Emerald-Park/03.mp3',
# "Guiding Light" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/04.mp3',
# "Wolf" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/05.mp3',
# "Blue" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/06.mp3',
# "Graduation Failed" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/07.mp3'
# }

def help
  puts "I accept the following commands:",
    "- help : displays this help message",
    "- list : displays a list of songs you can play",
    "- play : lets you choose a song to play",
    "- exit : exits the program"
end



def list(my_songs)
  songs = my_songs.keys
  songs.each{|song| puts song}
end


def play(my_songs)
  #this method is slightly different!
  #you should still ask the user for input and collect their song choice
  #this time, only allow user's to input a song name
  #check to see if the name they give is in fact a key of the my_songs hash
  #if it isn't, tell them their choice is invalid
  #if it is, play the song using the system 'open <file path>' syntax
  #get the file path of the song by looking it up in the my_songs hash
  picked_song = nil
  puts "Please enter a song name:"
  input = gets.chomp
  my_songs.keys.each do |song|
    if input == song
      picked_song = song
    end
  end
  if picked_song == nil
    puts "Invalid input, please try again"
  else
    puts "Playing #{picked_song}"
    system "xdg-open #{my_songs[picked_song]}"
  end
end

def exit_jukebox
  puts "Goodbye"
end

def run(songs)
  help
  input = nil
  while input != "exit"
    puts "Please enter a command:"
    input = gets.chomp
    case
    when input == "help"
      help
    when input == "list"
      list(songs)
    when input == "play"
      play(songs)
    else
      puts "Invalid input, please try again"
    end
  end
  exit_jukebox
end
