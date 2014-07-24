class User < ActiveRecord::Base

	has_many :comments

	before_save { self.email = email.downcase }
	before_create :create_remember_token

	validates :name, presence: true

	validates :name, length: { maximum: 50 },
		allow_blank: true
	

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true
	validates :email,
				format: { with: VALID_EMAIL_REGEX },
				uniqueness: { case_sensitive: false }, #uniqueness: true
				allow_blank: true
	
	has_secure_password
	
	validates :password, length: { minimum: 6 },
		allow_blank: true
	

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end

end
