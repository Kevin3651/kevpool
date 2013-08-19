class AddCategoriesIdToRide < ActiveRecord::Migration
  def change
    add_column :rides, :categories_id, :integer
  end
end
