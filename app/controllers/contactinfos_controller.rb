class ContactinfosController < ApplicationController
  
  before_filter :authenticate_user!
  
  # GET /contactinfos
  # GET /contactinfos.json
  def index
      redirect_to people_path
  end

  # GET /contactinfos/new
  # GET /contactinfos/new.json
  def new
    @contactinfo = Contactinfo.new
    # set the people_id and the type_ident for the hidden fields on the form
    @contactinfo.people_id = params[:id]    
    @contactinfo.type_ident = 'Address'
    # get all the contact types for addresses to display in the select box on the form
    @contact_type = Contacttype.logged_in_user(current_user.id).where(:type_ident => ['Phone', 'Email']).all
    
    # data dump to the logger
    logger.debug "address_type array:"
    @contact_type.each {|ctype| logger.debug "#{ctype.type_ident}, #{ctype.type_name}" }
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @contactinfo }
    end
  end


  # GET /contactinfos/1/edit
  def edit
    @contactinfo = Contactinfo.logged_in_user(current_user.id).find(params[:id])
    @contact_type = Contacttype.logged_in_user(current_user.id).where(:type_ident => ['Phone', 'Email']).all
  end


  # POST /contactinfos
  # POST /contactinfos.json
  def create
    @contactinfo = Contactinfo.new(params[:contactinfo])
    @contactinfo.user_id = current_user.id
    
    respond_to do |format|
      if @contactinfo.save
        format.html { redirect_to person_path(@contactinfo.people_id), :notice => 'Contactinfo was successfully created.' }
        format.json { render :json => @contactinfo, :status => :created, :location => @contactinfo }
      else
        format.html { render :action => "new" }
        format.json { render :json => @contactinfo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contactinfos/1
  # PUT /contactinfos/1.json
  def update
    @contactinfo = Contactinfo.find(params[:id])

    respond_to do |format|
      if @contactinfo.update_attributes(params[:contactinfo])
        format.html { redirect_to person_path(@contactinfo.people_id), :notice => 'Contactinfo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @contactinfo.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /contactinfos/1
  # DELETE /contactinfos/1.json
  def destroy
    @contactinfo = Contactinfo.find(params[:id])
    @people_id = @contactinfo.people_id
    @contactinfo.destroy

    respond_to do |format|
      format.html { redirect_to person_path(@people_id) }
      format.json { head :ok }
    end
  end
end
