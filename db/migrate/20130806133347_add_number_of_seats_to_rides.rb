class AddNumberOfSeatsToRides < ActiveRecord::Migration
  def change
    add_column :rides, :number_of_seats, :integer
  end
end
