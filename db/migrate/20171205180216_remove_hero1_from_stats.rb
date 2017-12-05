class RemoveHero1FromStats < ActiveRecord::Migration[5.0]
  def change
    remove_column :stats, :hero1, :string
  end
end
