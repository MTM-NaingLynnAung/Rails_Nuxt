class CreateCarModels < ActiveRecord::Migration[6.1]
  def change
    create_table :car_models do |t|
      t.references :manufacture, index: true, foreign_key: true
      t.string :name
      t.timestamps
    end
  end
end
