class AddTelephoneToCar < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :telephone, :integer
  end
end
