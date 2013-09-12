class AddCodeConfrimAndConfrimToUserd < ActiveRecord::Migration
  def change
      add_column    :users, :code_confirm,  :string
      add_column    :users, :confirm,       :boolean, default: false
      remove_column :users, :admin,         :string
      add_column    :users, :admin,         :string, default: false       
  end
end
