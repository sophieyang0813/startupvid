class Post < ApplicationRecord
  # include PgSearch
  belongs_to :user
  # pg_search_scope :highlight, -> (highlight) { where('highlight ILIKE ?')}

  #callback
  # before_save :capitalize_highlight

  def self.search(highlight)
    Post.where("highlight ILIKE ?", "%#{highlight}%")
  end 

  def self.playTvid(channelid)
    if channelid == 0 #teech in asia 
      @tchannel = Yt::Channel.new id:  "UCFzaq1XfqnCDbZdmPoI-1zw"

      @vidarr1 = @tchannel.videos  #.where(q: '(C-SPAN)') 
    elsif channelid == 1  # tech insider 
      @tchannel = Yt::Channel.new id: "UC_x5XG1OV2P6uZZ5FSM9Ttw"

      @vidarr1 = @tchannel.videos
   elsif channelid == 2  #Ggle dvelper 
    @tchannel = Yt::Channel.new id:  "UC_x5XG1OV2P6uZZ5FSM9Ttw"
    @vidarr1 = @tchannel.videos
    end 
      @randNum1 = rand(1..15)
      @tVid = @vidarr1.take(@randNum1.to_i).last
  end 


 def self.playPvid(chanlid)
  if chanlid == 3 #bloomberg
    @pchannel = Yt::Channel.new id: 'UCIALMKvObZNtJ6AmdCLP7Lg'
    @vidarr2 = @pchannel.videos  #.where(q: '(C-SPAN)') 
  elsif chanlid == 4  #marketwatch
    @plicychannel = Yt::Channel.new id: 'UCPaSu8qnjJhF1vkXVOGojBQ'
    @vidarr2 = @plicychannel.videos
  end 
    @randNum2 = rand(1..15)
    @pVid = @vidarr2.take(@randNum2.to_i).last
end 


 def self.playSvid(chanlid)
  if chanlid == 5 #y combinator 
    @schannel = Yt::Channel.new id: 'UCcefcZRL2oaA_uBNeo5UOWg'
    @vidarr3  = @schannel.videos

  elsif chanlid == 6  #KPCB
    @schannel = Yt::Channel.new id: 'UCkNsANayKfsdXFXHpBm8LQg'
    @vidarr3 = @schannel.videos
  end 
    @vidrr3 = @schannel.videos
    @randNum3 = rand(1..15)
    @sVid = @vidarr3.take(@randNum3.to_i).last
end 



private 
  # def  capitalize_highlight
  # self.highlight = highlight.capitalize
  # end 



end
