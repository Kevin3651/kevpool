json.array!(@profiles) do |profile|
  json.extract! profile, :user_id, :name, :cell, :aboutme, :music, :interests, :year
  json.url profile_url(profile, format: :json)
end
