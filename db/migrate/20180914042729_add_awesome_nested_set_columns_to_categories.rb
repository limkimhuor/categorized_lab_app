class AddAwesomeNestedSetColumnsToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :lft, :integer, null: false
    add_column :categories, :rgt, :integer, null: false
    add_column :categories, :depth, :integer, null: false, default: 0
    add_column :categories, :children_count, :integer, null: false, default: 0

    add_index :categories, :lft
    add_index :categories, :rgt
    add_index :categories, :depth
  end
end
