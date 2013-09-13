class CreateGroupProducts < ActiveRecord::Migration
  def change
    create_table :group_products do |t|
      t.string :name

      t.timestamps
    end
  end
end
