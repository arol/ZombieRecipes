class ChangeRatingFormatInRecipes < ActiveRecord::Migration
  def up
    change_column :recipes, :rating, :float
  end

  def down
    change_column :recipes, :rating, :integer
  end
end
