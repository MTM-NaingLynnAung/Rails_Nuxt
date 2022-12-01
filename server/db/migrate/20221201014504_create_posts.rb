class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :condition
      t.string :trim_name
      t.string :engine_power
      t.string :steering_position
      t.string :fuel_type
      t.string :color
      t.string :price
      t.string :vin
      t.string :plate_number
      t.integer :seat
      t.integer :door
      t.text :description
      t.string :year
      t.string :phone
      t.text :address
      t.timestamps
    end
  end
end
