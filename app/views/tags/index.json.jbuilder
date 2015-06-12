json.array!(@tags) do |tag|
  json.extract! tag, :id, :name, :user_id, :status, :the_type
  json.url tag_url(tag, format: :json)
end
