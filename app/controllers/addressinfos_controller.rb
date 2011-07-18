class AddressinfosController < ApplicationController
  
  before_filter :authenticate_user!
  
  # GET /addressinfos
  # GET /addressinfos.json
  def index
      redirect_to people_path
  end


  # GET /addressinfos/new
  # GET /addressinfos/new.json
  def new
    @addressinfo = Addressinfo.new
    # set the people_id and the type_ident for the hidden fields on the form
    @addressinfo.people_id = params[:id]    
    @addressinfo.type_ident = 'Address'
    # get all the contact types for addresses to display in the select box on the form
    @address_type = Contacttype.logged_in_user(current_user.id).where(:type_ident => 'Address').all
    
    # data dump to the logger
    logger.debug "address_type array:"
    @address_type.each {|addr| logger.debug "#{addr.type_ident}, #{addr.type_name}" }
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @addressinfo }
    end
  end


  # GET /addressinfos/1/edit
  def edit
    @addressinfo = Addressinfo.logged_in_user(current_user.id).find(params[:id])
    @address_type = Contacttype.logged_in_user(current_user.id).where(:type_ident => 'Address').all
  end


  # POST /addressinfos
  # POST /addressinfos.json
  def create
    @addressinfo = Addressinfo.new(params[:addressinfo])
    @addressinfo.user_id = current_user.id
    
    respond_to do |format|
      if @addressinfo.save
        format.html { redirect_to person_path(@addressinfo.people_id), :notice => 'Addressinfo was successfully created.' }
        format.json { render :json => @addressinfo, :status => :created, :location => @addressinfo }
      else
        format.html { render :action => "new" }
        format.json { render :json => @addressinfo.errors, :status => :unprocessable_entity }
      end
    end
  end


  # PUT /addressinfos/1
  # PUT /addressinfos/1.json
  def update
    @addressinfo = Addressinfo.find(params[:id])

    respond_to do |format|
      if @addressinfo.update_attributes(params[:addressinfo])
        format.html { redirect_to person_path(@addressinfo.people_id), :notice => 'Addressinfo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @addressinfo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /addressinfos/1
  # DELETE /addressinfos/1.json
  def destroy
    @addressinfo = Addressinfo.find(params[:id])
    @people_id = @addressinfo.people_id
    @addressinfo.destroy

    respond_to do |format|
      format.html { redirect_to person_path(@people_id) }
      format.json { head :ok }
    end
  end
end
