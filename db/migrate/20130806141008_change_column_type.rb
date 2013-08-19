class ChangeColumnType < ActiveRecord::Migration
  def change
  	change_column :rides, :Seats, :integer
  end
end
