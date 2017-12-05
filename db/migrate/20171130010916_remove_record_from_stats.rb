class RemoveRecordFromStats < ActiveRecord::Migration[5.0]
  def change
    remove_column :stats, :record, :string
  end
end
