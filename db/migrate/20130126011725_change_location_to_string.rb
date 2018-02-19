class ChangeLocationToString < ActiveRecord::Migration[5.1]
  def change
    change_column :instructables, :location, :string
  end
end
