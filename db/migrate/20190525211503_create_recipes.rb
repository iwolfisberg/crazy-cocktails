class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :description
      t.references :cocktail, foreign_key: true

      t.timestamps
    end
  end
end
