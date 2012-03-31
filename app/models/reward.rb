##
#
class Reward < ActiveRecord::Base

	STATUS_ACTIVE = 'active'
	STATUS_REDEEMED = 'redeemed'

	belongs_to :user

	attr_accessor :type

	def get_reward_type()
		RewardType.find( self.reward_type_id )
	end

	def redeem( notes=nil )
		self.status = STATUS_REDEEMED
		self.redeem_note = notes if( notes != nil)
		self.save
	end

end
