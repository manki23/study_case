class TableNewsletterSubscribers < ActiveRecord::Migration[6.0]
  def change
    create_table :newsletter_subscribers
    add_column :newsletter_subscribers, :subscriber_id, :integer
    add_index :newsletter_subscribers, :subscriber_id
  end
end
