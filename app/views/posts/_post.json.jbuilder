json.extract! post, :id, :snow_condition, :crowd_level, :star_rating, :notes, :trail_id, :user_id, :created_at, :updated_at
json.url post_url(post, format: :json)
