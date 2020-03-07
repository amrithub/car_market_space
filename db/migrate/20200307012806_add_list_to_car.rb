class AddListToCar < ActiveRecord::Migration[5.2]
  def change
    add_reference :cars, :list, foreign_key: true
  end
end
