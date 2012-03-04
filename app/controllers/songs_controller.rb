class SongsController < ApplicationController
  # GET /songs
  # GET /songs.xml
  def index
    @songs = Song.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @songs }
    end
  end

  # GET /songs/1
  # GET /songs/1.xml
  def show
    @song = Song.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @song }
    end
  end

  # GET /songs/new
  # GET /songs/new.xml
  def new
    @song = Song.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @song }
    end
  end

  # GET /songs/1/edit
  def edit
    @song = Song.find(params[:id])
  end

  # POST /songs
  # POST /songs.xml
  def create
    @song = Song.new(params[:song])

    respond_to do |format|
      if @song.save
        format.html { redirect_to(@song, :notice => 'Song was successfully created.') }
        format.xml  { render :xml => @song, :status => :created, :location => @song }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /songs/1
  # PUT /songs/1.xml
  def update
    @song = Song.find(params[:id])

    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to(@song, :notice => 'Song was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.xml
  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    respond_to do |format|
      format.html { redirect_to(songs_url) }
      format.xml  { head :ok }
    end
  end

  def send_request
    p = params[:name]
    respond_to do |format|
      format.js { render(:json => p) }
    end
  end

  def post_request

    @song = Song.new(params[:song])

    respond_to do |format|
      if @song.save
        format.html { redirect_to(@song, :notice => 'Song was successfully requested.') }
        format.xml  { render :xml => @song, :status => :created, :location => @song }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
      end
    end


    p = params['name']
    respond_to do |format|
      format.js { render(:text => p) }
    end
  end

  def now_playing
    
    @now_playing_song = Song.where("playing=?", true).first
    #@now_playing_song = Song.order(:id).last

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @now_playing_song }
    end
  end
  
  def vote
    song_id = params['song_id']
    @song = Song.find(song_id)
    #@song.update_attributes({:upvotes => 
    direction = params['direction']
    if direction == "up"
      @song.increment(:upvotes)
    elsif direction == "down"
      @song.increment(:downvotes)
    end
    messages = 'none!'
    if @song.save
      messages = 'save successful'
    else
      messages = 'save failed'
    end
    respond_to do |format|
      format.js { render(:text => song_id + '; ' + direction + '; messages: ' + messages) }
    end
  end

  def dj

    
    @now_playing_song = Song.where("playing=?", true).first
    #@now_playing_song = Song.order(:id).last

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @now_playing_song }
    end
  end
end
