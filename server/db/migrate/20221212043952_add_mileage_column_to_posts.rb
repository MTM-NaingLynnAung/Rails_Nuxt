class AddMileageColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :mileage, :bigint, after: :transmission
  end
end
