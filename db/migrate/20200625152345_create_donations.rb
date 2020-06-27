class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.integer :user_id
      t.integer :charity_id
      t.integer :donation_amount
      t.date :donation_date
      t.text :donation_note
      t.boolean :favorite, default: false
      t.timestamps
    end
  end
end
