class User < ActiveRecord::Base

	attr_accessor :password_confirmation

	has_many :comments

	before_save { self.email = email.downcase }
	before_create :create_remember_token

	validates :name, presence: { message: "Заполните поле 'Имя'" }

	validates :name, length: { maximum: 50,
		message: "- Длина имени не должна превышать 50 символов"},
		allow_blank: true
	

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: { message: "Заполните поле 'Email'" }
	validates :email,
				format: { with: VALID_EMAIL_REGEX, message: "Email введен неверно" },
				uniqueness: { case_sensitive: false }, #uniqueness: true
				allow_blank: true
	
	has_secure_password validations: false
	validates :password, 
		presence: { message: "Заполните поле 'Пароль'" }
	validates_confirmation_of :password, message: "Заполните поле 'Повтор пароля'"
	validates :password, length: { minimum: 6,
		message: "- Длина пароля должна быть более 6 символов" },
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
