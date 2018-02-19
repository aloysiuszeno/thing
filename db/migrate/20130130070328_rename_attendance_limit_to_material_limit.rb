class RenameAttendanceLimitToMaterialLimit < ActiveRecord::Migration[5.1]
  def change
    rename_column :instructables, :attendance_limit, :material_limit
  end
end
