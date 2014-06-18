class Film < ActiveRecord::Base

	has_many :comments

	before_save { self.name = name.mb_chars.downcase.to_s }

	validates 	:name,
				uniqueness: { case_sensitive: false }

end
