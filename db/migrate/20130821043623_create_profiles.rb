class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.string :cell
      t.text :aboutme
      t.text :music
      t.text :interests
      t.string :year

      t.timestamps
    end
  end
end
