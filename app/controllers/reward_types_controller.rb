class RewardTypesController < ApplicationController
  # GET /reward_types
  # GET /reward_types.json
  def index
    @reward_types = RewardType.where( "user_id = ? OR private = false",  session[:login][:user_id] )

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @reward_types }
    end
  end

  # GET /reward_types/1
  # GET /reward_types/1.json
  def show
    @reward_type = RewardType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @reward_type }
    end
  end

  # GET /reward_types/new
  # GET /reward_types/new.json
  def new
    @reward_type = RewardType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @reward_type }
    end
  end

  # GET /reward_types/1/edit
  def edit
    @reward_type = RewardType.find(params[:id])
  end

  # POST /reward_types
  # POST /reward_types.json
  def create
    @reward_type = RewardType.new(params[:reward_type])

    respond_to do |format|
      if @reward_type.save
        format.html { redirect_to @reward_type, :notice => 'Reward type was successfully created.' }
        format.json { render :json => @reward_type, :status => :created, :location => @reward_type }
      else
        format.html { render :action => "new" }
        format.json { render :json => @reward_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reward_types/1
  # PUT /reward_types/1.json
  def update
    @reward_type = RewardType.find(params[:id])

    respond_to do |format|
      if @reward_type.update_attributes(params[:reward_type])
        format.html { redirect_to @reward_type, :notice => 'Reward type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @reward_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reward_types/1
  # DELETE /reward_types/1.json
  def destroy
    @reward_type = RewardType.find(params[:id])
    @reward_type.destroy

    respond_to do |format|
      format.html { redirect_to reward_types_url }
      format.json { head :no_content }
    end
  end
end
