class AddOverrideLocationToInstances < ActiveRecord::Migration[5.1]
  def change
    add_column :instances, :override_location, :boolean
  end
end
