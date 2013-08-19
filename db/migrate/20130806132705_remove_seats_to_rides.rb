class RemoveSeatsToRides < ActiveRecord::Migration
  def change
    remove_column :rides, :seats, :string
  end
end
