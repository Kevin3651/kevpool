class AddRideNumberOfSeatsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :ride_number_of_seats, :integer
  end
end
