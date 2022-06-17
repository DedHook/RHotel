class AddUserIdToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :user_id, :integer
    add_index :bookings, :user_id, unique: true
    add_column :bookings, :room_id, :integer
    add_index :bookings, :room_id

  end
end
