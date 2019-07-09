class User < ApplicationRecord
	has_secure_password
	validates :name, :email, presence: true
	before_create :create_remember_token
		
	private
	def create_remember_token
		token = SecureRandom.urlsafe_base64 
		self.remember_token = Digest::SHA1.hexdigest(token)
	end
end
