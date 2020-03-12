class TableContactInterests < ActiveRecord::Migration[6.0]
  def change
    remove_column :contacts, :interest_id, :integer
    create_table :contact_interests
    add_column :contact_interests, :contact_id, :integer
    add_index :contact_interests, :contact_id
    add_column :contact_interests, :interest_id, :integer
    add_index :contact_interests, :interest_id
  end
end
