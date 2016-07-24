class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :hash_password
      t.string :role

      t.timestamps null: false
    end
  end
end
