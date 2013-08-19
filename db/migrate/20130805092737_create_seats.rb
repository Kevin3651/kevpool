class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.integer :ride_id
      t.integer :user_id

      t.timestamps
    end
  end
end
