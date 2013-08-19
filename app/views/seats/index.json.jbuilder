json.array!(@seats) do |seat|
  json.extract! seat, 
  json.url seat_url(seat, format: :json)
end
