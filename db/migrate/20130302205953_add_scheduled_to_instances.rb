class AddScheduledToInstances < ActiveRecord::Migration[5.1]
  def change
    add_column :instructables, :scheduled, :boolean, default: false
  end
end
