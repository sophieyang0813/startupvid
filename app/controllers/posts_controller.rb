class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @tnum = rand(0..2)
    @techVid = Post.playTvid(@tnum.to_i)
    @tech_title = @techVid.title
    @tech_id = @techVid.id
    @tech_html = "<iframe width= 500 height= 380 src=//www.youtube.com/embed/" + @tech_id + "?start=30&" + "autoplay=1&" + "frameborder=0 gesture=media allowfullscreen></iframe>"

    @pnum = rand(3..4)
    @pVid = Post.playPvid(@pnum.to_i)
    @p_title = @pVid.title
    @p_id = @pVid.id
    @p_html = "<iframe width= 500 height= 380 src=//www.youtube.com/embed/" + @p_id + "?start=10&" + "autoplay=1&" + "frameborder=0 gesture=media allowfullscreen></iframe>"

    @snum = rand(5..6)
    @s = Post.playSvid(@snum.to_i)
    @s_title = @s.title
    @s_id = @s.id
    @s_html = "<iframe width= 500 height= 380 src=//www.youtube.com/embed/" + @s_id + "?start=60&" + "autoplay=1&" + "frameborder=0 gesture=media allowfullscreen></iframe>"

    respond_to do |format|
      format.js
      format.html
    end 

  end

 
  def search
    @posts = Post.search(params[:highlight])
    respond_to do |format|
    format.js
    format.html
    end
  end 


  # GET /posts/1
  # GET /posts/1.json
  def show
    
  end

  # GET /posts/new
  def new
    @post = Post.new
    @user_posts = Post.where(user_id: current_user.id)
    # vid
     @posts = Post.all
    @tnum = rand(0..2)
    @techVid = Post.playTvid(@tnum.to_i)
    @tech_title = @techVid.title
    @tech_id = @techVid.id
    @tech_html = "<iframe width= 500 height= 380 src=//www.youtube.com/embed/" + @tech_id + "?start=30&" + "autoplay=1&" + "frameborder=0 gesture=media allowfullscreen></iframe>"

    @pnum = rand(3..4)
    @pVid = Post.playPvid(@pnum.to_i)
    @p_title = @pVid.title
    @p_id = @pVid.id
    @p_html = "<iframe width= 500 height= 380 src=//www.youtube.com/embed/" + @p_id + "?start=10&" + "autoplay=1&" + "frameborder=0 gesture=media allowfullscreen></iframe>"

    @snum = rand(5..6)
    @s = Post.playSvid(@snum.to_i)
    @s_title = @s.title
    @s_id = @s.id
    @s_html = "<iframe width= 500 height= 380 src=//www.youtube.com/embed/" + @s_id + "?start=60&" + "autoplay=1&" + "frameborder=0 gesture=media allowfullscreen></iframe>"
    respond_to do |format|
      format.js
      format.html
    end 
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id 

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:highlight, :content)
    end
end
