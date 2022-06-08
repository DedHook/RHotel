class AddUserIdToFriends < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :user_id, :integer
    add_index :friends, :user_id, unique: true
    add_column :friends, :room_id, :integer
    add_index :friends, :room_id, unique: true

  end
end
