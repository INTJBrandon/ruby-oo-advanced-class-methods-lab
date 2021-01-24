require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new_by_name(name)
    @@all << song
    song
  end


  def self.find_by_name(name)
    self.all.find{|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    ordered = self.all.sort_by{|song| song.name}
    ordered
  end

  def self.new_from_filename(filename)
    arr = filename.split(" - ")
    song_name = arr[1][0...-4]
    artist = arr[0]
    song = Song.new_by_name(song_name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    @@all << new_song
    new_song
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end
end
