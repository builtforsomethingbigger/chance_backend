class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.date :dob
      t.string :email_address
      t.string :password
      t.text :street_address
      t.text :street_address_2
      t.string :city
      t.integer :zip
      t.string :phone_number
      t.string :cc_number
      t.date :cc_exp_date
      t.string :cc_type
      t.integer :cc_cvv
      t.timestamps
    end
  end
end
