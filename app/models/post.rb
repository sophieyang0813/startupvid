class Post < ApplicationRecord
  # include PgSearch
  belongs_to :user
  # pg_search_scope :highlight, -> (highlight) { where('highlight ILIKE ?')}

  #callback
  before_save :capitalize_highlight

  def self.search(highlight)
    Post.where("highlight ILIKE ?", "%#{highlight}%")
  end 

  def self.playTvid(channelid)
    @channelid = 'UCFzaq1XfqnCDbZdmPoI-1zw' if channelid == 0 #tech in asia
    @channelid = 'UC_x5XG1OV2P6uZZ5FSM9Ttw' if channelid == 1  #tchInsdr 
    @channelid = 'UC_x5XG1OV2P6uZZ5FSM9Ttw' if channelid == 2  #Ggledvlpr
    @channel = Yt::Channel.new id: @channelid 

    @videoarr = @channel.videos
    # @maxNum = @channel.videos.count
    # @randNum= rand(0..@maxNum.to_i)
    # @randVid = @videoarr.take(@randNum.to_i).last
    @randNum= rand(0..15)
    @randVid = @videoarr.take(@randNum.to_i).last

  end 

  # not work 
  # def self.playPvid(chanlid)
  #   if chanlid == 3 #bloomberg 
  #     @pchannel = Yt::Channel.new id: 'UCIALMKvObZNtJ6AmdCLP7Lg'
  #     @vidarr1 = @pchannel.videos
  #       byebug
  #     @randNum 
  #     @pVid
  #   elsif chanlid == 4  #marketwatch
  #     @pchannel = Yt::Channel.new id: 'UCPaSu8qnjJhF1vkXVOGojBQ'
  #     @vidrr1 = @pchannel.videos
  #     @randNum
  #     @pVid
  #   end 
  #     @randNum = rand(0..15)
  #     @pVid = @vidarr1.take(@randNum.to_i).last
  # end 


    def self.playPvid(chanlid)
    if chanlid == 3 #bloomberg
      @plicychannel = Yt::Channel.new id: 'UCIALMKvObZNtJ6AmdCLP7Lg'
      @vidarr1 = @plicychannel.videos  #.where(q: '(C-SPAN)') 
      @randNum1 
      @pVid
    elsif chanlid == 4  #marketwatch
      @plicychannel = Yt::Channel.new id: 'UCPaSu8qnjJhF1vkXVOGojBQ'
      @vidrr1 = @plicychannel.videos
      @randNum1
      @pVid
    end 
      @randNum1 = rand(0..15)
      @pVid = @vidarr1.take(@randNum1.to_i).last
  end 



private 
  def  capitalize_highlight
  self.highlight = highlight.capitalize
  end 



end
