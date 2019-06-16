class RenameOrderToOrdering < ActiveRecord::Migration[5.2]
  def change
  	rename_table :orders, :orderings
  end
end
