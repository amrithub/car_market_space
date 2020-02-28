class AddCostToCar < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :cost, :integer
  end
end
