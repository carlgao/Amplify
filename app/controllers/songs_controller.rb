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

    @songs = Song.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @now_playing_song }
    end
  end

  def play
    song_id = params['song_id']
    #@songs = Song.all
    Song.update_all({ :playing => false })
    @song = Song.find(song_id)
    #@songs.each do |s|
      #s.update_attributes( { :playing => false } )
      #s.save
    #end
    @song.update_attributes( { :playing => true } )

    if @song.save
      messages = 'playing save successful'
    else
      messages = 'playing save failed'
    end
    respond_to do |format|
      format.js { render(:text => song_id + '; ' + '; messages: ' + messages) }
    end
  end

  #def not_play
    #song_id = params['song_id']
    #@song = Song.find(song_id)
    #@song.update_attributes( { :playing => false } );

    #if @song.save
      #messages = 'not playing save successful'
    #else
      #messages = 'not playing save failed'
    #end
    #respond_to do |format|
      #format.js { render(:text => song_id + '; ' + '; messages: ' + messages) }
    #end
  #end
  
  def hotness
    new_hotness = params['hotness'].to_i
    @now_playing_song = Song.where("playing=?", true).first
    hotness = @now_playing_song.hotness
    hotcount = @now_playing_song.hotcount
    if hotness == nil
      hotness = 0
    end
    if hotcount == nil
      hotcount = 0
    end
    if hotcount > 20
      calc_hotness = (hotness * (hotcount - 1) + new_hotness) / (hotcount)
    else
      calc_hotness = (new_hotness + hotness * hotcount) / (hotcount + 1)
      @now_playing_song.increment( :hotcount )
    end
    @now_playing_song.update_attributes( { :hotness => calc_hotness } )
    @now_playing_song.save
    respond_to do |format|
      format.js { render(:text => new_hotness.to_s + '; ' ) }
    end
  end
end
