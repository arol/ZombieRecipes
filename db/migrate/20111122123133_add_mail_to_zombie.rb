class AddMailToZombie < ActiveRecord::Migration
  def change
    add_column :zombies, :mail, :string
  end
end
