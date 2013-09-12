class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :birthday
      t.string :phone_number
      t.string :city
      t.string :address
      t.string :email
      t.boolean :admin

      t.timestamps
    end
  end
end
