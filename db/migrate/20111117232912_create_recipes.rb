class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :body
      t.string :ingredients
      t.time :cooktime
      t.integer :rating
      t.integer :numVotes

      t.timestamps
    end
  end
end
