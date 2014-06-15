json.array!(@comments) do |comment|
  json.extract! comment, :user_id, :film_id, :liked, :text
  json.url comment_url(comment, format: :json)
end