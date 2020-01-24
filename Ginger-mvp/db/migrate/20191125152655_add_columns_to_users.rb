class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :primary_number, :string
    add_column :users, :secondary_number, :string
    add_column :users, :primary_first_name, :string
    add_column :users, :primary_last_name, :string
    add_column :users, :secondary_first_name, :string
    add_column :users, :secondary_last_name, :string
  end
end
