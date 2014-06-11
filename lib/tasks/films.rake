# bundle exec rake db:reset
# bundle exec rake db:films
# bundle exec rake test:prepare
namespace :db do
	
	task films: :environment do 

		Film.create!(name: "Человеческая многоножка",
					 year: "2009",
					 short_description: "Короткое описание",
					 full_description: "Полное описание",
					 link_to_kinopoisk: "kinopoisk.ru",
					 image: "mnogonogka_1.png")

		99.times do |n|
			name = "Человеческая многоножка #{n+1}"
			Film.create!(name: name,
					 	 year: "2011",
					 	 short_description: "Короткое описание",
					 	 full_description: "Полное описание",
					 	 link_to_kinopoisk: "kinopoisk.ru",
					 	 image: "mnogonogka_1.png")
		end

	end

end