class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :I_am
      t.string :Starting_From
      t.string :Going_to
      t.string :string
      t.date :depart
      t.date :return
      t.string :Price
      t.string :Seats
      t.string :Notes
      t.integer :number_of_seats

      t.timestamps
    end
  end
end
