class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.bigint :parent_id, null: true, index: true

      t.timestamps
    end
  end
end
