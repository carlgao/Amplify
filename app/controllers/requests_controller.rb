class RequestsController < ApplicationController
  # GET /requests
  # GET /requests.xml
  def index
    @requests = Request.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @requests }
    end
  end

  # GET /requests/1
  # GET /requests/1.xml
  def show
    @request = Request.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @request }
    end
  end

  # GET /requests/new
  # GET /requests/new.xml
  def new
    @request = Request.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @request }
    end
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
  end

  # POST /requests
  # POST /requests.xml
  def create
    @request = Request.new(params[:request])

    respond_to do |format|
      if @request.save
        format.html { redirect_to(@request, :notice => 'Request was successfully created.') }
        format.xml  { render :xml => @request, :status => :created, :location => @request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /requests/1
  # PUT /requests/1.xml
  def update
    @request = Request.find(params[:id])

    respond_to do |format|
      if @request.update_attributes(params[:request])
        format.html { redirect_to(@request, :notice => 'Request was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.xml
  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to(requests_url) }
      format.xml  { head :ok }
    end
  end

  def request_song
    @requests = Request.all
  end

  def post_request
    n = params['name']
    @request = Request.where("name=?", n).first
    if @request != nil
      @request.increment(:score)
    elsif
      @request = Request.new(:name => n, :score => 1) 
    end
    @request.save
    respond_to do |format|
      format.js { render(:text => n ) }
    end
  end

  def vote
    request_id = params['request_id']
    @request = Request.find(request_id)
    @request.increment(:score)

    messages = 'none!'
    if @request.save
      messages = 'save successful'
    else
      messages = 'save failed'
    end
    respond_to do |format|
      format.js { render(:text => request_id + '; ' + '; messages: ' + messages) }
    end
  end

end
