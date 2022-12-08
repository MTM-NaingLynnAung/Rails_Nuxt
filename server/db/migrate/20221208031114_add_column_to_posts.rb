class AddColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :transmission, :string, after: :steering_position
  end
end
