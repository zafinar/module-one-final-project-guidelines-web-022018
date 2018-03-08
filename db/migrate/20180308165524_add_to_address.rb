class AddToAddress < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string  :incident_address
      t.string  :incident_zip
      t.string  :cross_street_1
      t.string  :cross_street_2
      t.string  :borough
      t.string  :city
      t.string  :location_type
      t.string  :address_type
      t.string  :street_name
    end
  end
end
