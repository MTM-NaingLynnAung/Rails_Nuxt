class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :phone, :string, after: :password_digest
    add_column :users, :address, :text, after: :phone
  end
end
