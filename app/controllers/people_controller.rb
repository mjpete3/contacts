class PeopleController < ApplicationController
  
  before_filter :authenticate_user!
  
  # GET /people
  # GET /people.json
  def index
    logger.debug "Parammeter passed in: #{params.inspect}"
    logger.debug "User criteria: #{current_user.id}, #{current_user.email}"

    if params[:letter].blank?
      @people = Person.logged_in_user(current_user.id).order(:last_name).all
    else
      @people = Person.logged_in_user(current_user.id).order(:last_name).alphabetical_group(params[:letter])
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @people }
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.logged_in_user(current_user.id).find(params[:id])
    @address = Addressinfo.logged_in_user(current_user.id).where(:people_id => params[:id])
    @contactinfo = Contactinfo.logged_in_user(current_user.id).where(:people_id => params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @person }
    end
  end

  # GET /people/new
  # GET /people/new.json
  def new
    @person = Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = Person.logged_in_user(current_user.id).find(params[:id])
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(params[:person])
    @person.user_id = current_user.id

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, :notice => 'Person was successfully created.' }
        format.json { render :json => @person, :status => :created, :location => @person }
      else
        format.html { render :action => "new" }
        format.json { render :json => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.json
  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to @person, :notice => 'Person was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :ok }
    end
  end
end
