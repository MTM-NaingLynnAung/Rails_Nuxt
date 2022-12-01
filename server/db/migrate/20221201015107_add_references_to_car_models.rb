class AddReferencesToCarModels < ActiveRecord::Migration[6.1]
  def change
    add_reference :car_models, :manufacture, foreign_key: true
  end
end
