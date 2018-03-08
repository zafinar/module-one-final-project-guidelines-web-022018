class AddToComplaintAddressJoin < ActiveRecord::Migration[5.0]
  def change
    create_table :complaint_addresses do |t|
      t.integer :address_id
      t.integer :complaint_id
    end
  end
end
