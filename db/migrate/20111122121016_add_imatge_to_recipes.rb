class AddImatgeToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :imatge, :string
  end
end
