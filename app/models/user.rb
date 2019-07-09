class User < ApplicationRecord
	has_secure_password

	validates :name, :email, presence: true
	
	before_create :create_user
		
	private 

	def create_user
		remember_token = SecureRandom.urlsafe_base64.to_s
		User.create({remember_token: Digest::SHA1.hexdigest("remember_token")})	
	end


end
