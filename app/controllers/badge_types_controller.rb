class BadgeTypesController < ApplicationController
  # GET /badge_types
  # GET /badge_types.json
  def index
    @badge_types = BadgeType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @badge_types }
    end
  end

  # GET /badge_types/1
  # GET /badge_types/1.json
  def show
    @badge_type = BadgeType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @badge_type }
    end
  end

  # GET /badge_types/new
  # GET /badge_types/new.json
  def new
    @badge_type = BadgeType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @badge_type }
    end
  end

  # GET /badge_types/1/edit
  def edit
    @badge_type = BadgeType.find(params[:id])
  end

  # POST /badge_types
  # POST /badge_types.json
  def create
    @badge_type = BadgeType.new(params[:badge_type])

    respond_to do |format|
      if @badge_type.save
        format.html { redirect_to @badge_type, :notice => 'Badge type was successfully created.' }
        format.json { render :json => @badge_type, :status => :created, :location => @badge_type }
      else
        format.html { render :action => "new" }
        format.json { render :json => @badge_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /badge_types/1
  # PUT /badge_types/1.json
  def update
    @badge_type = BadgeType.find(params[:id])

    respond_to do |format|
      if @badge_type.update_attributes(params[:badge_type])
        format.html { redirect_to @badge_type, :notice => 'Badge type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @badge_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /badge_types/1
  # DELETE /badge_types/1.json
  def destroy
    @badge_type = BadgeType.find(params[:id])
    @badge_type.destroy

    respond_to do |format|
      format.html { redirect_to badge_types_url }
      format.json { head :no_content }
    end
  end
end
