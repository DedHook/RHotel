class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
