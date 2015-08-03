class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :contactable, polymorphic: true, index: true
      t.string :email
      t.string :phone
      t.string :street_address
      t.string :city
      t.string :state
      t.string :country,              default: 'United States'
      t.string :postal
      t.boolean :show_email,          default: false
      t.boolean :show_phone,          default: false
      t.boolean :show_street_address, default: false
      t.string :country_code,         default: 'us'

      t.timestamps null: false
    end
  end
end
