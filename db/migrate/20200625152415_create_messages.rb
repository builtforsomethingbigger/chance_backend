class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :inbox_id
      t.text :message_title
      t.text :message_body
      t.timestamps
    end
  end
end
