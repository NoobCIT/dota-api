class RemoveHero3FromStats < ActiveRecord::Migration[5.0]
  def change
    remove_column :stats, :hero3, :string
  end
end
