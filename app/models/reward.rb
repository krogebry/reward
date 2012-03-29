##
#
class Reward < ActiveRecord::Base

	belongs_to :user

	attr_accessor :type

end
