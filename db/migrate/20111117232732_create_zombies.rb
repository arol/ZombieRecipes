class CreateZombies < ActiveRecord::Migration
  def change
    create_table :zombies do |t|
      t.string :name
      t.string :avatar
      t.string :bio
      t.date :death

      t.timestamps
    end
  end
end
