class ContacttypesController < ApplicationController
  
  before_filter :authenticate_user!
  
  # GET /contacttypes
  # GET /contacttypes.json
  def index
    @contacttypes = Contacttype.logged_in_user(current_user.id).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @contacttypes }
    end
  end

  # GET /contacttypes/new
  # GET /contacttypes/new.json
  def new
    @contacttype = Contacttype.new
    @option_type = "<option value='Phone'>Phone</option><option value='Email'>Email</option><option value='Address'>Address</option>"
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @contacttype }
    end
  end

  # GET /contacttypes/1/edit
  def edit
    @contacttype = Contacttype.logged_in_user(current_user.id).find(params[:id])
    @option_type = "<option value='Phone'>Phone</option><option value='Email'>Email</option><option value='Address'>Address</option>"
  end

  # POST /contacttypes
  # POST /contacttypes.json
  def create
    logger.info "Parammeter passed in: #{params.inspect}"
    @contacttype = Contacttype.new(params[:contacttype])
    @contacttype.user_id = current_user.id
    
    respond_to do |format|
      if @contacttype.save
        format.html { redirect_to contacttypes_path, :notice => 'Contacttype was successfully created.' }
        format.json { render :json => @contacttype, :status => :created, :location => @contacttype }
      else
        format.html { render :action => "new" }
        format.json { render :json => @contacttypes.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contacttypes/1
  # PUT /contacttypes/1.json
  def update
    @contacttype = Contacttype.find(params[:id])

    respond_to do |format|
      if @contacttype.update_attributes(params[:contacttype])
        format.html { redirect_to contacttypes_path, :notice => 'Contacttype was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @contacttype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contacttypes/1
  # DELETE /contacttypes/1.json
  def destroy
    @contacttype = Contacttype.find(params[:id])
    @contacttype.destroy

    respond_to do |format|
      format.html { redirect_to contacttypes_url }
      format.json { head :ok }
    end
  end
end
