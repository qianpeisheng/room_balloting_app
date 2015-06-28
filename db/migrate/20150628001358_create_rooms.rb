class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :block
      t.integer :name
      t.string :gender
      t.string :sd
      t.integer :vacancy

      t.timestamps null: false
    end
  end
end
