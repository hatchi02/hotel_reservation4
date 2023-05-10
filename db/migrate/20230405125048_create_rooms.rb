class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :detail
      t.string :address
      t.integer :charge
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
