class CreateStats < ActiveRecord::Migration[5.0]
  def change
    create_table :stats do |t|
      t.integer :mmr
      t.string :hero1
      t.string :hero2
      t.string :hero3
      t.integer :duration

      t.timestamps
    end
  end
end
