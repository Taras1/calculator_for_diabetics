class RenamePassworHashToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :password_hash, :password
  end
end
