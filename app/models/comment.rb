class Comment < ActiveRecord::Base

	belongs_to :user
	belongs_to :film

	def Comment.get_positive(comments)
		number = 0
		if comments.any?
			comments.each { |comment| number = number + 1 if comment.liked? }			
		end
		return number
	end

	def Comment.get_negative(comments)
		number = 0
		if comments.any?
			comments.each { |comment| number = number + 1 unless comment.liked? }
		end		
		return number
	end

end
