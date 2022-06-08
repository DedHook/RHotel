class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.date :start_date
      t.date :end_date

      t.timestamps

    end
  end
end
