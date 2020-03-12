class ModifyTableContactInterestToInterestId < ActiveRecord::Migration[6.0]
  def change
    remove_column :contacts, :interest, :text
    add_column :contacts, :interest_id, :integer
    add_index :contacts, :interest_id
  end
end
