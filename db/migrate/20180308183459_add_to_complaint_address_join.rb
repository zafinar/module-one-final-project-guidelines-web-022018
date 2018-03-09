class AddToComplaintAddressJoin < ActiveRecord::Migration[5.0]
  def change
    create_table :complaint_addresses do |t|
      t.integer :address_id
      t.integer :complaint_id
      t.string  :descriptor
    end
  end
end
