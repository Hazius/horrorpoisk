class Film < ActiveRecord::Base

	has_many :comments

	before_save do 
		self.name_rus = name_rus.mb_chars.downcase.to_s
		self.name_eng = name_eng.mb_chars.downcase.to_s
	end

	after_find do |film|
		film.name_rus[0] = film.name_rus[0].mb_chars.upcase.to_s
		film.name_eng[0] = film.name_eng[0].mb_chars.upcase.to_s
	end

end
