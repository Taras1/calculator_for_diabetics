class RenameConfirmToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :confirm, :confirm_email
  end
end
