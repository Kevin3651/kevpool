class AddRideSeatsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :ride_Seats, :string
  end
end
