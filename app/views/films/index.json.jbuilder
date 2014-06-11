json.array!(@films) do |film|
  json.extract! film, :id, :name, :year, :short_description, :full_description, :link_to_kinopoisk
  json.url film_url(film, format: :json)
end
