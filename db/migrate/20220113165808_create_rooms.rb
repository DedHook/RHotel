class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :tip 
      t.float :price
      t.text :description
      t.string :picture

      t.timestamps
    end
  end
end
