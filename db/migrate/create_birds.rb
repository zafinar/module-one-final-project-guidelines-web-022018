class CreateBirds < ActiveRecord::Migration

  def change
    create_table :birds do |t|
      t.string :bird_name
    end
  end
end
