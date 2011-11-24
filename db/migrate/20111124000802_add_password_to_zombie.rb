class AddPasswordToZombie < ActiveRecord::Migration
  def change
    add_column :zombies, :password, :string
  end
end
