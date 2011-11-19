class AddZombieIdToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :zombie_id, :integer
  end
end
