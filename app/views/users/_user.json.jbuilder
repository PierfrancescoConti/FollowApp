json.extract! user, :id, :usname, :following, :created_at, :updated_at
json.url user_url(user, format: :json)
