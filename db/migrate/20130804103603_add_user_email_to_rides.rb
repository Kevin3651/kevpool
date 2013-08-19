class AddUserEmailToRides < ActiveRecord::Migration
  def change
    add_column :rides, :user_email, :string
  end
end
