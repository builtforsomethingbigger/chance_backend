class CreateCharities < ActiveRecord::Migration[6.0]
  def change
    create_table :charities do |t|
      t.text :charity_name
      t.integer :ein, :limit => 8
      t.text :tag_line
      t.text :website_url
      t.float :current_rating
      t.float :financial_rating
      t.float :accountability_rating
      t.text :cause
      t.integer :income_amount, :limit => 8
      t.text :mailing_street_address
      t.text :mailing_street_address_2
      t.string :mailing_city
      t.integer :mailing_zipcode
      t.timestamps
    end
  end
end
