json.extract! user, :id, :first_name, :last_name, :home_mountain, :discipline, :ability, :photo, :email, :password_digest, :created_at, :updated_at
json.url user_url(user, format: :json)
