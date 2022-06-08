class CreateHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :histories do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.date :start_date
      t.date :end_date
      t.integer :nomer

      t.timestamps
    end
  end
end
