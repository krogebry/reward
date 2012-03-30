class RewardsController < ApplicationController
  # GET /rewards
  # GET /rewards.json
  def index
    @all_rewards = Reward.where( "user_id IS NOT NULL AND user_id > 0" )
		@my_rewards = Reward.where({ :user_id => session[:login][:user_id] })
		@rewards_given = Reward.where({ :rewarded_by_user_id => session[:login][:user_id] })

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @rewards }
    end
  end

  # GET /rewards/1
  # GET /rewards/1.json
  def show
    @reward = Reward.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @reward }
    end
  end

  # GET /rewards/new
  # GET /rewards/new.json
  def new
		@users = User.all
    @reward = Reward.new
		@reward_types = RewardType.where( "user_id = ? OR private = false",  session[:login][:user_id] )

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @reward }
    end
  end

	def redeem
	end

  # GET /rewards/1/edit
  def edit
		@users = User.all
    @reward = Reward.find(params[:id])
		@reward_types = RewardType.where( "user_id = ? OR private = false",  session[:login][:user_id] )
  end

  # POST /rewards
  # POST /rewards.json
  def create
    @reward = Reward.new(params[:reward])
		@reward.rewarded_by_user_id = session[:login][:user_id]

    respond_to do |format|
      if @reward.save
        format.html { redirect_to @reward, :notice => 'Reward was successfully created.' }
        format.json { render :json => @reward, :status => :created, :location => @reward }
      else
        format.html { render :action => "new" }
        format.json { render :json => @reward.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rewards/1
  # PUT /rewards/1.json
  def update
    @reward = Reward.find(params[:id])

    respond_to do |format|
      if @reward.update_attributes(params[:reward])
        format.html { redirect_to @reward, :notice => 'Reward was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @reward.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rewards/1
  # DELETE /rewards/1.json
  def destroy
    @reward = Reward.find(params[:id])
    @reward.destroy

    respond_to do |format|
      format.html { redirect_to rewards_url }
      format.json { head :no_content }
    end
  end
end
