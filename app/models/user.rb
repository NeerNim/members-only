class User < ApplicationRecord
	has_secure_password
	validates :name, :email, presence: true
	VALIDATE_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+[a-z]+\z/i
	validates :email, uniqueness: true, length: {
		maximum: 255
	},
	format: {with: VALIDATE_EMAIL}

	

	before_create :create_remember_token
	has_many :posts

	def index
		@user = User.find(sessions[:user_id])
	end


	private
	def create_remember_token
		token = SecureRandom.urlsafe_base64 
		self.remember_token = Digest::SHA1.hexdigest(token)
	end
end
