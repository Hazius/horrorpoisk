class Film < ActiveRecord::Base

	has_many :comments

	before_save do 
		self.name_rus = name_rus.mb_chars.downcase.to_s
		self.name_eng = name_eng.mb_chars.downcase.to_s
	end

	validates 	:name,
				uniqueness: { case_sensitive: false }

end
