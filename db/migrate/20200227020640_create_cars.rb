class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.date :date_posted
      t.string :model
      t.integer :kilometres
      t.date :last_edited
      t.integer :year_manufactured
      t.string :make
      t.integer :body_type
      t.integer :transmission
      t.integer :air_conditioning
      t.string :colour

      t.timestamps
    end
  end
end
