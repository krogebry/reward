##
#
class Reward < ActiveRecord::Base

	belongs_to :user

	attr_accessor :type

	def get_reward_type()
		RewardType.find( self.reward_type_id )
	end

end
