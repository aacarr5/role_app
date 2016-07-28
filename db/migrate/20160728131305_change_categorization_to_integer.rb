class ChangeCategorizationToInteger < ActiveRecord::Migration
  def change
  	remove_column :categorizations, :category_id
  	add_column :categorizations, :category_id, :integer
  end
end
