class AddPuPositionToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :pu_staff, :boolean
  end
end
