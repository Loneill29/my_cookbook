class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.text :body
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
