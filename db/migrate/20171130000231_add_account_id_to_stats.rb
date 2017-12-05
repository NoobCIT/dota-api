class AddAccountIdToStats < ActiveRecord::Migration[5.0]
  def change
    add_column :stats, :account_id, :integer
  end
end
