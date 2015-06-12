json.array!(@stuffs) do |stuff|
  json.extract! stuff, :id, :content, :deadline, :status, :user_id
  json.url stuff_url(stuff, format: :json)
end
