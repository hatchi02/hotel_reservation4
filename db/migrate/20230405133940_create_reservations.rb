class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :checkin
      t.date :checkout
      t.integer :guest
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
