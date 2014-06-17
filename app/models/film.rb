class Film < ActiveRecord::Base

	has_many :comments

	before_save { self.name = name.downcase }

	validates 	:name,
				uniqueness: { case_sensitive: false }

end
