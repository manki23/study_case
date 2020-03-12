class TableInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :interests
    add_column :interests, :name, :string
  end
end
