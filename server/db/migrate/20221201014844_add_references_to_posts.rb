class AddReferencesToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :manufacture, foreign_key: true, :default => nil
    add_reference :posts, :user, foreign_key: true, :default => nil
    add_reference :posts, :car_model, foreign_key: true, :default => nil
    add_reference :posts, :build_type, foreign_key: true, :default => nil
  end
end
