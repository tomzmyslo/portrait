class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :last_name, :string
    add_column :users, :email, :string, unique: true
    add_column :users, :username, :string, unique: true
    add_column :users, :admin, :boolean, default: false
    rename_column :users, :name, :first_name
    rename_column :users, :password, :password_digest
  end

  def down
    remove_column :users, :last_name
    remove_column :users, :email
    remove_column :users, :username
    remove_column :users, :admin
    rename_column :users, :first_name, :name
    rename_column :users, :password_digest, :password
  end
end
