class RemoveScaffolds < ActiveRecord::Migration
  def change
  	drop_table :scaffolds
  end
end
