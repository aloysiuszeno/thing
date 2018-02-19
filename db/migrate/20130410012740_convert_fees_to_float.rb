class ConvertFeesToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :instructables, :handout_fee, :float
    change_column :instructables, :material_fee, :float
  end
end
