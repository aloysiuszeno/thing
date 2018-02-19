class AddInfoTagToInstructables < ActiveRecord::Migration[5.1]
  def change
    add_column :instructables, :info_tag, :string
  end
end
