class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :header
      t.text :content
      t.integer :author_id

      t.timestamps null: false
    end
  end
end
