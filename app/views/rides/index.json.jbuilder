json.array!(@rides) do |ride|
  json.extract! ride, :I_am, :Starting_From, :Going_to, :string, :depart, :return, :Price, :Seats, :Notes
  json.url ride_url(ride, format: :json)
end
