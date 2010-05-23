class TimeSlitsController < ApplicationController
  # GET /time_slits
  # GET /time_slits.xml
  def index
    @time_slits = TimeSlit.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @time_slits }
    end
  end

  # GET /time_slits/1
  # GET /time_slits/1.xml
  def show
    @time_slit = TimeSlit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @time_slit }
    end
  end

  # GET /time_slits/new
  # GET /time_slits/new.xml
  def new
    @time_slit = TimeSlit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @time_slit }
    end
  end

  # GET /time_slits/1/edit
  def edit
    @time_slit = TimeSlit.find(params[:id])
  end

  # POST /time_slits
  # POST /time_slits.xml
  def create
    @time_slit = TimeSlit.new(params[:time_slit])

    respond_to do |format|
      if @time_slit.save
        format.html { redirect_to(@time_slit, :notice => 'TimeSlit was successfully created.') }
        format.xml  { render :xml => @time_slit, :status => :created, :location => @time_slit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @time_slit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /time_slits/1
  # PUT /time_slits/1.xml
  def update
    @time_slit = TimeSlit.find(params[:id])

    respond_to do |format|
      if @time_slit.update_attributes(params[:time_slit])
        format.html { redirect_to(@time_slit, :notice => 'TimeSlit was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @time_slit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /time_slits/1
  # DELETE /time_slits/1.xml
  def destroy
    @time_slit = TimeSlit.find(params[:id])
    @time_slit.destroy

    respond_to do |format|
      format.html { redirect_to(time_slits_url) }
      format.xml  { head :ok }
    end
  end
end
