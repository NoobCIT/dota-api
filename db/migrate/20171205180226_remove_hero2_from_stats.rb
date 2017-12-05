class RemoveHero2FromStats < ActiveRecord::Migration[5.0]
  def change
    remove_column :stats, :hero2, :string
  end
end
