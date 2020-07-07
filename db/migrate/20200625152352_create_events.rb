class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.integer :charity_id
      t.date :event_date
      t.text :event_title
      t.string :event_type
      t.text :event_description
      t.timestamps
    end
  end
end
