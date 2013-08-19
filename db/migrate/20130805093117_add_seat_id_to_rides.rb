class AddSeatIdToRides < ActiveRecord::Migration
  def change
    add_column :rides, :seat_id, :integer
  end
end
