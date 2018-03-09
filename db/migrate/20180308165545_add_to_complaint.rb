class AddToComplaint < ActiveRecord::Migration[5.0]
  def change
    create_table :complaints do |t|
      t.string  :complaint_type
    end
  end
end
