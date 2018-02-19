class AddScheduleToInstructable < ActiveRecord::Migration[5.1]
  def change
    add_column :instructables, :schedule, :string
  end
end
