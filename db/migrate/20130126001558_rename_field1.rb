class RenameField1 < ActiveRecord::Migration[5.1]
  def change
    rename_column :instructor_profiles, :sca_name_titled, :sca_title
  end
end
