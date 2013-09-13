class AddSubGroupToGroupProducts < ActiveRecord::Migration
  def change
    add_column :group_products, :belong_group, :integer
  end
end
