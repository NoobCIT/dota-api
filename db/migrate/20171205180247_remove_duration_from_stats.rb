class RemoveDurationFromStats < ActiveRecord::Migration[5.0]
  def change
    remove_column :stats, :duration, :integer
  end
end
