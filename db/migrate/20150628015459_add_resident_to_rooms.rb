class AddResidentToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :resident, :string
  end
end
