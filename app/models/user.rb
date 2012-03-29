##
#
require 'digest/sha1'

class User < ActiveRecord::Base

	#attr_protected :id, :salt
	attr_accessor :password,:password_confirmation

	def self.authenticate( username,password )
		puts "Authenticating..."
		return false unless username
		return false unless password

		u=find(:first, :conditions=>["username = ?", username])
		puts "User: %s" % u.inspect
		return false if u.nil?
		return u if User.encrypt(password, u.salt) == u.hashed_password
		false
	end

	def self.random_string(len)
		#generate a random password consisting of strings and digits
		chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
		newpass = ""
		1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
		return newpass
	end

	def password=(pass)
		@password=pass
		self.salt = User.random_string(10) if !self.salt?
		self.hashed_password = User.encrypt(@password, self.salt)
	end

	def self.encrypt(pass, salt)
		Digest::SHA1.hexdigest(pass+salt)
	end

	def self.authenticate(username, pass)
		u=find(:first, :conditions=>["username = ?", username])
		return nil if u.nil?
		return u if User.encrypt(pass, u.salt)==u.hashed_password
		nil
	end  

end
