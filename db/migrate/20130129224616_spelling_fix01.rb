class SpellingFix01 < ActiveRecord::Migration[5.1]
  def change
    rename_column :instructables, :head_source_description, :heat_source_description
  end
end
