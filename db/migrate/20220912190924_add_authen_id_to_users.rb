class AddAuthenIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :authen_id, :integer
    add_index :users, :authen_id
  end
end
