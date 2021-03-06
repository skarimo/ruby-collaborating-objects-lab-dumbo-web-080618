class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    file_d = file_name.chomp(".mp3").split(" - ")
    a_name = file_d[0]
    s_name = file_d[1]

    new_s = Song.new(s_name)
    new_s.artist_name = a_name
    new_s
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    self.artist = artist
    artist.add_song(self)
  end


end
