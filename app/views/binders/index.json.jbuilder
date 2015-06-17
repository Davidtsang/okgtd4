json.array!(@binders) do |binder|
  json.extract! binder, :id, :name, :user_id, :status, :stuffs_count, :the_type
  json.url binder_url(binder, format: :json)
end
