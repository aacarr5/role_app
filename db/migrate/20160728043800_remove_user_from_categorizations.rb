class RemoveUserFromCategorizations < ActiveRecord::Migration
  def change
  	remove_column :categorizations, :user_id
  	add_column :categorizations, :category_id, :string
  end
end
