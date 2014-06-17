# bundle exec rake db:reset
# bundle exec rake db:films
# bundle exec rake test:prepare
namespace :db do
	
	task films: :environment do 

		User.create!(name: "Pavel",
					 email: "rwr_pavel@mail.ru",
					 password: "19901990",
					 password_confirmation: "19901990"	
					)		

		53.times do |n|
			name = "Человеческая многоножка #{n+1}"
			Film.create!(name: name,
					 	 year: "2009",
					 	 short_description: Faker::Lorem.sentence(5),
					 	 full_description: Faker::Lorem.sentence(15),
					 	 producer: Faker::Name.name,
					 	 link_to_kinopoisk: "https://www.kinopoisk.ru",
					 	 image: "mnogonogka_1.png")
		end

		films = Film.all()
		user = User.first()

		26.times do
			comment = Faker::Lorem.sentence(15)
			films.each do |film| 
			 	film.comments.create!(user_id: user.id,
			 						  liked: "true",
			 						  text: comment
			 						 ) 
				film.comments.create!(user_id: user.id,
			 						  liked: "false",
			 						  text: comment
			 						 ) 
			end
		end

	end

end