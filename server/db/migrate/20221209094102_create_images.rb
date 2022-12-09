class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :src
      t.bigint :imageable_id
      t.string :imageable_type
      t.timestamps
    end
    add_index :images, [:imageable_type, :imageable_id]
  end
end
