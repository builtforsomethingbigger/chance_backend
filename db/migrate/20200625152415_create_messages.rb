class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :message_title
      t.text :message_body
      t.timestamps
    end
  end
end
