require "yt"
class Clip < ApplicationRecord
  has_many :hintfragments
  belongs_to :fragment
  before_validation :myfunc
  attr_accessor :titre, :lienvid
  def myfunc
    videos = Yt::Collections::Videos.new
    #if self.formulaire == "bonjour"
     self.title= videos.where(id: self.link+',invalid').map(&:title)[0] #pour formulaire
    #end
    self.description= videos.where(id: self.link+',invalid').map(&:description)[0]
    self.sortie= videos.where(id: self.link+',invalid').map(&:published_at)[0].to_date
    thumb=VideoThumb::get("http://www.youtube.com/watch?v=#{self.link}", "medium")
    self.image=thumb
    self.artist = self.title.split("-")[0].strip.squish
    #system("(cd '#{Rails.root.to_s}/public/uploads' && wget '#{thumb}')")
  end

end
