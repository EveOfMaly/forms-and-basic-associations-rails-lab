class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(artist_name)
    artist = Artist.find_or_create_by(name: artist_name)
    artist.songs << self  
  end

  def note_contents
  
    self.notes.map {|note| note.content ? note.content : nil}
  end

  def note_contents=(note_content_array)
    
    note_content_array.each do |note| 
      if !note.empty? 
        self.notes << Note.find_or_create_by(content: note)
      end
    end   


  end
 

 




end
