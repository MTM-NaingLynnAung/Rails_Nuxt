class CreateBuildTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :build_types do |t|
      t.string :name
      t.timestamps
    end
  end
end
