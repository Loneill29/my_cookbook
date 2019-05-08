class AddCategoryToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :category_id, :integer
    add_index :recipes, :category_id
  end
end
